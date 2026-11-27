class ApplicationController < ActionController::Base
  allow_browser versions: :modern

  before_action :configure_permitted_parameters,
                if: :devise_controller?

  protected

  def configure_permitted_parameters
    return unless resource_name == :customer_account

    fields = [:username, :full_name, :address, :city,
              :postal_code, :province_id]

    devise_parameter_sanitizer.permit(:account_update, keys: fields)
    devise_parameter_sanitizer.permit(:sign_up, keys: fields)
  end
end
