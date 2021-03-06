class ApplicationController < ActionController::Base
    
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    add_flash_types :info, :error, :warning
    
    #check if user already signed in and redirects to user page if so.
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
