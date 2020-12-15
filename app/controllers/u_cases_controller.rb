class UCasesController < ApplicationController
  before_action :set_u_case, only: [:update, :destroy]

  def create
    @u_case = UCase.new(u_case_params)

    respond_to do |format|
      if @u_case.save
        format.html { redirect_back(fallback_location: root_path, notice: 'Zgłoszenie zostało utworzone.') }
        format.json { render :show, status: :created, location: @u_case }
      else
        format.html { render :new }
        format.json { render json: @u_case.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @u_case.update(u_case_params)
        format.html { redirect_back(fallback_location: root_path, notice: 'Zgłoszenie zostało zmienione.') }
        format.json { render :show, status: :ok, location: @u_case }
      else
        format.html { render :edit }
        format.json { render json: @u_case.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @u_case.destroy
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path, notice: 'Zgłoszenie zostało usunięte.') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_u_case
      @u_case = UCase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def u_case_params
      params.require(:u_case).permit(:title, :body, :user_id)
    end
end
