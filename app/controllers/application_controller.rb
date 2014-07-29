class ApplicationController < ActionController::Base
  # reset captcha code after each request for security
  after_filter :reset_last_captcha_code!

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include SimpleCaptcha::ControllerHelpers
  protect_from_forgery with: :exception
  

  protected
  def after_sign_in_path_for(resource)
    if simple_captcha_valid?
      home_path
    else
      root_path
    end
    #home_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  
end
