class HomeController < ApplicationController
  def index
    @current_tacacs_user = TacacsUser.find_by_id(current_user.id)
  end
end