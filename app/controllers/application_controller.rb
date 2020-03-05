class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from Exception, with: :rescue_from_exception
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found 


  def rescue_from_exception(e)
    @exception = e 
    render 'errors/500'
  end 

  def record_not_found(e) 
    @exception = e
    render 'errors/500'
  end 

  class Forbidden < ActionController::ActionControllerError
  end 
  
  rescue_from Forbidden, with: :forbidden  
  
  def forbidden(e)
    @exception = e 
    render 'errors/500'
  end 


  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :user_image, :family_name, :first_name, :family_name_kana, :first_name_kana, :birth_year, :birth_month, :birth_day, :introduction])
  end
end
