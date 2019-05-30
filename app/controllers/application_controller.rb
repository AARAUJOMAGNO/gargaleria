class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:terms])

    devise_parameter_sanitizer.permit(:account_update, keys: [:photo, :first_name, :last_name, :address, :birthdate, :cpf])
  end
end
