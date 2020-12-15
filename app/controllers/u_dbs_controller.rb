class UDbsController < ApplicationController
  before_action :set_u_db, only: [:update, :destroy]
  before_action :authenticate_user!

  def create
    @u_db = UDb.new(u_db_params)

    respond_to do |format|
      if @u_db.save
        format.html { redirect_back(fallback_location: root_path, notice: 'Baza danych została utworzona.') }
        format.json { render :show, status: :created, location: @u_db }
      else
        format.html { render :new }
        format.json { render json: @u_db.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @u_db.update(u_db_params)
        format.html { redirect_back(fallback_location: root_path, notice: 'Baza danych została zmieniona.') }
        format.json { render :show, status: :ok, location: @u_db }
      else
        format.html { render :edit }
        format.json { render json: @u_db.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @u_db.destroy
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path, notice: 'Baza danych została usunięta.') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_u_db
      @u_db = UDb.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def u_db_params
      params.require(:u_db).permit(:name, :server_id, :password, :username)
    end
end
