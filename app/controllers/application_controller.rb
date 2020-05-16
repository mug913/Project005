class ApplicationController < ActionController::Base
    
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :authenticate_user!

    add_flash_types :info, :error, :warning
    
    def index
        if user_signed_in?
            redirect_to user_path(current_user)
        end
    end

    
    
    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password])  
        devise_parameter_sanitizer.permit(:sign_in, keys: [:username, :email, :password])  
        devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email, :password])  
    end

end
