class DnsRecordsController < ApplicationController
  before_action :set_dns_record, only: [:update, :destroy]
  before_action :authenticate_user!

  def create
    @dns_record = DnsRecord.new(dns_record_params)

    respond_to do |format|
      if @dns_record.save
        format.html { redirect_back(fallback_location: root_path, notice: 'Rekord został utworzony.') }
        format.json { render :show, status: :created, location: @dns_record }
      else
        format.html { render :new }
        format.json { render json: @dns_record.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @dns_record.update(dns_record_params)
        format.html { redirect_back(fallback_location: root_path, notice: 'Rekord został zmieniony.') }
        format.json { render :show, status: :ok, location: @dns_record }
      else
        format.html { render :edit }
        format.json { render json: @dns_record.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @dns_record.destroy
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path, notice: 'Rekord został usunięty.') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dns_record
      @dns_record = DnsRecord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dns_record_params
      params.require(:dns_record).permit(:dtype, :name, :ttl, :value, :domain_id)
    end
end
