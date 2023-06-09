class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    protect_from_forgery with: :exception
    protected
        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :username])
        end
    
    def after_sign_in_path_for(resource) 
        # task indexに飛ばす
        tasks_path
    end
end
