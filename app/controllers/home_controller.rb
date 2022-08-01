class HomeController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @current_tacacs_user = TacacsUser.find_by_id(current_user&.id)
  end
end