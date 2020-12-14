class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @servers = current_user.servers.order(:name)
    @payments = current_user.payments.order(:deadline)
    @domains = current_user.domains.order(:name)
    @additional_services = AdditionalService.all
  end

  def user_domains
    @domains = current_user.domains.order(:name)
  end

  def user_payments
    @payments = current_user.payments.order(:deadline)
  end

  def additional_services_list
    @additional_services = AdditionalService.all
  end

  def user_server_settings
    @server = current_user.servers.find(params[:id])
  end

  def server_list
    @servers = current_user.servers.order(:name)
  end

  def new_user_server
    @server = Server.new
  end

  def create_user_server
    @server = Server.new(server_params)
    @server.user = current_user
    @server.paid = true
    @server.disk_space = rand(0..@server.package.disk_space)

    respond_to do |format|
      if @server.save
        format.html { redirect_to server_list_path, notice: 'Server was successfully created.' }
        format.json { render :show, status: :created, location: @server }
      else
        format.html { render :new_user_server }
        format.json { render json: @server.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def server_params
    params.require(:server).permit(:name, :package_id)
  end

end
