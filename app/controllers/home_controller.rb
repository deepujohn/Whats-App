class HomeController < ApplicationController
  def index
  	unless user_signed_in?
  		redirect_to welcome_path
  	end
  end
  def welcome
  end
end
