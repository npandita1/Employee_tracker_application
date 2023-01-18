class DesignationsController < ApplicationController
    before_action :identify_employee

    def index 
        @designations = Designation.all
    end 

    def show 
        @designation = Designation.find(params[:id])
    end    

    def new 
        @designation = Designation.new
    end    

    def create 
        @designation = Designation.new(params.require(:designation).permit(:name))
        if @designation.save
            flash[:notice] = "Designation was successfully created."
            redirect_to designation_path(@designation)
        else 
            render 'new'    
        end    
    end    

    def edit 
        @designation = Designation.find(params[:id])
    end    

    def update 
        @designation = Designation.new(params.require(:designation).permit(:name))
        if @designation.update
            flash[:notice] = "Designation was successfully updated."
            redirect_to designation_path(@designation)
        else 
            render 'edit'    
        end 
    end    

    private

    def identify_employee 
        unless current_employee.master_role.name == "HR Manager"
            flash[:alert] = "You do not have access to this section" 
            redirect_to employee_root_path 
        end 
    end    

end    