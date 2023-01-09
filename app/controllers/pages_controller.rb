class PagesController < ApplicationController
    include PagesHelper

    def index 
        
    end    

    def dashboard
        @employee = current_employee
    end     

    def show 
        @employees = Employee.all
    end    

end    