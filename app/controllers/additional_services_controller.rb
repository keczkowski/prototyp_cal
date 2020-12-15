class AdditionalServicesController < ApplicationController
  before_action :set_additional_service, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /additional_services
  # GET /additional_services.json
  def index
    @additional_services = AdditionalService.all
  end

  # GET /additional_services/1
  # GET /additional_services/1.json
  def show
  end

  # GET /additional_services/new
  def new
    @additional_service = AdditionalService.new
  end

  # GET /additional_services/1/edit
  def edit
  end

  # POST /additional_services
  # POST /additional_services.json
  def create
    @additional_service = AdditionalService.new(additional_service_params)

    respond_to do |format|
      if @additional_service.save
        format.html { redirect_to @additional_service, notice: 'Additional service was successfully created.' }
        format.json { render :show, status: :created, location: @additional_service }
      else
        format.html { render :new }
        format.json { render json: @additional_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /additional_services/1
  # PATCH/PUT /additional_services/1.json
  def update
    respond_to do |format|
      if @additional_service.update(additional_service_params)
        format.html { redirect_to @additional_service, notice: 'Additional service was successfully updated.' }
        format.json { render :show, status: :ok, location: @additional_service }
      else
        format.html { render :edit }
        format.json { render json: @additional_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /additional_services/1
  # DELETE /additional_services/1.json
  def destroy
    @additional_service.destroy
    respond_to do |format|
      format.html { redirect_to additional_services_url, notice: 'Additional service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_additional_service
      @additional_service = AdditionalService.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def additional_service_params
      params.require(:additional_service).permit(:name, :body)
    end
end
