class ConceptsController < ApplicationController
  before_action :set_concept, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :is_verified
  before_action :has_access_to_concepts

  # GET /concepts
  # GET /concepts.json
  def index
    @q = Concept.ransack(params[:q])
    @concepts = @q.result(distinct: true).page params[:page]
  end

  # GET /concepts/1
  # GET /concepts/1.json
  def show
  end

  # GET /concepts/new
  def new
    @concept = Concept.new
  end

  # GET /concepts/1/edit
  def edit
  end

  # POST /concepts
  # POST /concepts.json
  def create
    if concept_params[:tag_ids].present?
      new_tag_ids = []
      concept_params[:tag_ids].each do |tag_id|
        if tag_id.length > 0 and Tag.exists?(tag_id)
          new_tag_ids << tag_id
        else
          t = Tag.find_or_create_by(name: tag_id)
          new_tag_ids << t.id
        end
      end
    end
    @concept = Concept.new(concept_params.except(:tag_ids))
    @concept.user_id = current_user.id
    respond_to do |format|
      if @concept.save
        new_tag_ids.each do |new_tag_id|
          ConceptTag.find_or_create_by(concept_id: @concept.id, tag_id: new_tag_id)
        end
        format.html { redirect_to @concept, notice: 'Definicja pojęcia została dodana.' }
        format.json { render :show, status: :created, location: @concept }
      else
        format.html { render :new }
        format.json { render json: @concept.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /concepts/1
  # PATCH/PUT /concepts/1.json
  def update
    if concept_params[:tag_ids].present?
      new_tag_ids = []
      concept_params[:tag_ids].each do |tag_id|
        if tag_id.length > 0 and Tag.exists?(tag_id)
          new_tag_ids << tag_id
        else
          if tag_id.present?
            t = Tag.find_or_create_by(name: tag_id)
            new_tag_ids << t.id
          end
        end
      end
    end
    @concept.user_id = current_user.id
    respond_to do |format|
      if @concept.update(concept_params.except(:tag_ids))
        new_tag_ids.each do |new_tag_id|
          ConceptTag.find_or_create_by(concept_id: @concept.id, tag_id: new_tag_id)
        end
        format.html { redirect_to @concept, notice: 'Definicja pojęcia została zmieniona.' }
        format.json { render :show, status: :ok, location: @concept }
      else
        format.html { render :edit }
        format.json { render json: @concept.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /concepts/1
  # DELETE /concepts/1.json
  def destroy
    @concept.destroy
    respond_to do |format|
      format.html { redirect_to concepts_url, notice: 'Definicja pojęcia została usunięta.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_concept
      @concept = Concept.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def concept_params
      params.require(:concept).permit(:name, :body, :user_id, tag_ids: [])
    end
end
