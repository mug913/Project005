class Admins::OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def google_oauth2
        admin = Admin.from_google(from_google_params)

        if admin.present?
            sign_out_all_scopes
            flash[:success] = t 'devise.omniauth_callbacks.success', kind: 'Google'
            sign_in_and_redirect admin, event: :authentication
        else
            flash[:alert] = t 'devise.omniauth_callbacks.failure', kind: 'Google', reason: "#{auth.info.email} is not authorized." 
            redirect_to_new_admin_session_path
        end
    end

    protected

    def after_omniauth_failure_path_for(scope)
        new_admin_session_path
    end

    def after_sign_in_path_for(resource_or_scope)
        stored_location_for(resource_or_scope) || '/admins/sessions/dashboard'
    end

    private

    def from_google_params
        @from_google_params ||= {
            uid: auth.uid,
            email: auth.info.email,
            full_name: auth.info.full_name,
            avatar_url: auth.info.image
        }
    end

    def auth
        @auth ||= request.env['omniauth.auth']
    end
end