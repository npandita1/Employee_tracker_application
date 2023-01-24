class ApplicationController < ActionController::Base 
    before_action :authenticate_employee!
    # before_action :require_login

    private 

    def authenticate_employee!
        unless employee_signed_in?
            flash[:alert] = "You must be logged in to access this section" 
            redirect_to root_path 
        end 
    end    

    # def require_login
    #     unless employee_signed_in?
    #         flash[:alert] = "You must be logged in to access this section" 
    #         redirect_to root_path 
    #     end 
    # end        

    def after_sign_in_path_for(resource)
        employee_root_path
    end        

end
