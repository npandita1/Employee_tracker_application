class PagesController < ApplicationController
    include PagesHelper
    skip_before_action :authenticate_employee!, :only => [:index]
    before_action :identify_employee, :except => [:index]
     
    def index 
        
    end    

    def dashboard
                             
    end     

    def show 
        @employees = Employee.all
    end    

    private

    def identify_employee
        case current_employee.master_role_id 
        when 1 
            @employee = "HR Manager"
        when 2
            @employee = "Project Manager"
        else 
            @employee = "Employee"
        end 
    end    

end    