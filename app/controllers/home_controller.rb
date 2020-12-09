class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @servers = current_user.servers
   end

end
