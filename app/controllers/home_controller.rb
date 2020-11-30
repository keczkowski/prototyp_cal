class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    if current_user.verified == true
      @mainTitle = "Witaj w systemie definicje.cal.pl"
      @mainDesc = "System służy do wprowadzania definicji do bazy danych."
    else
      @mainTitle = "Witaj w systemie definicje.cal.pl"
      @mainDesc = "W tej chwili nie masz dostępu do tej części systemu, gdyż Twoje konto nie zostało zweryfikowane lub nie posiadasz odpowiednich praw dostępu. Skontaktuj się
      z administratorem systemu."
    end
   end

   def minor
   end

end
