class UEmailsController < ApplicationController
  before_action :set_u_email, only: [:update, :destroy]
  before_action :authenticate_user!

  def create
    @u_email = UEmail.new(u_email_params)

    respond_to do |format|
      if @u_email.save
        format.html { redirect_back(fallback_location: root_path, notice: 'Skrzynka pocztowa została utworzona.') }
        format.json { render :show, status: :created, location: @u_email }
      else
        format.html { render :new }
        format.json { render json: @u_email.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @u_email.update(u_email_params)
        format.html { redirect_back(fallback_location: root_path, notice: 'Skrzynka pocztowa została zmieniona.') }
        format.json { render :show, status: :ok, location: @u_email }
      else
        format.html { render :edit }
        format.json { render json: @u_email.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @u_email.destroy
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path, notice: 'Skrzynka pocztowa została usunięta.') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_u_email
      @u_email = UEmail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def u_email_params
      params.require(:u_email).permit(:name, :server_id, :password, :disk_space, :title, :body, :forward_to)
    end
end
