class WelcomeController < ApplicationController
	def index	
		@portfolios = Portfolio.all
	end
	def about
	end
end
