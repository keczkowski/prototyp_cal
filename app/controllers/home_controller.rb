class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @servers = current_user.servers
    @payments = current_user.payments
    @additional_services = AdditionalService.all
   end

end
