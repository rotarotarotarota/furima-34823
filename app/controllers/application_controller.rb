class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  private
  def configure_permitted_parameters
    key_array = [:nickname, :first_name, :last_name, :kana_first_name, :kana_last_name, :birthday]
    devise_parameter_sanitizer.permit(:sign_up, keys: key_array)
  end
end
