class ApplicationController < ActionController::Base

    def after_sign_in_path_for(resource)
        employee_root_path
    end

end
