class UFtpsController < ApplicationController
  before_action :set_u_ftp, only: [:update, :destroy]
  before_action :authenticate_user!

  def create
    @u_ftp = UFtp.new(u_ftp_params)

    respond_to do |format|
      if @u_ftp.save
        format.html { redirect_back(fallback_location: root_path, notice: 'UFtp was successfully created.') }
        format.json { render :show, status: :created, location: @u_ftp }
      else
        format.html { render :new }
        format.json { render json: @u_ftp.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @u_ftp.update(u_ftp_params)
        format.html { redirect_back(fallback_location: root_path, notice: 'UFtp was successfully updated.') }
        format.json { render :show, status: :ok, location: @u_ftp }
      else
        format.html { render :edit }
        format.json { render json: @u_ftp.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @u_ftp.destroy
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path, notice: 'UFtp was successfully destroyed.') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_u_ftp
      @u_ftp = UFtp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def u_ftp_params
      params.require(:u_ftp).permit(:name, :server_id, :password, :home)
    end
end
