class HomeController < ApplicationController
  def index
=begin  	unless user_signed_in?
  		redirect_to root_path
  	end
=end  	
  end
  def welcome
  end
end
