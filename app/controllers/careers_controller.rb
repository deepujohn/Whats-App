class CareersController < ApplicationController
  before_action :set_career, only: [:show]
  before_action :authenticate_user!, only: [:show]
  def index
    @careers=Career.all
  end
  def new
  	@career=Career.new
  end

  def create  
    @career = Career.new(career_params)

    respond_to do |format|
     if @career.save
        UserMailer.career(@career).deliver 
        format.html { redirect_to new_career_path, notice: 'Thanks for the application.' }        
      else
        format.html { render :new }      
      end
    end
  end
  def show    
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_career
      @career = Career.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def career_params
      params.require(:career).permit(:first_name,:last_name,:city,:country,:email,:phone,:resume,:photo)
    end
end

