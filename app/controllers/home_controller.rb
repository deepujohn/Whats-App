class HomeController < ApplicationController
  def index
  	@portfolios = Portfolio.all
  end
  def welcome
  end
end
