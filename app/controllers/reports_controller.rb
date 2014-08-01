class ReportsController < ApplicationController
  def index
  end  
  def show  	
  	@careers=Career.all
  	
  	respond_to do |format|  
  	  format.html 	
  	  format.pdf do
  		render :pdf=>"/reports/show.pdf",
  		:layout=>"show.html.haml",
  		disposition: 'attachment'
  	  end  	  
    end  
  end  
end
