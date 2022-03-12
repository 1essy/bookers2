class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top, :about]

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    flash[:notice] = "User was successfully login."
    user_path(resource)
  end

  def after_sign_out_path_for(resource)
     flash[:notice] = "User was successfully logout."
    root_path
  end

  private

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,keys:[:email]) # 注目
    end
end

