class DivisionsController < ApplicationController
    before_action :identify_employee

    def index 
        @divisions = Division.all
    end 

    def show 
        @division = Division.find(params[:id])
    end    

    def new 
        @division = Division.new
    end    

    def create 
        @division = Division.new(params.require(:division).permit(:name))
        if @division.save
            flash[:notice] = "Division was successfully created."
            redirect_to division_path(@division)
        else 
            render 'new'    
        end    
    end  
    
    def edit 
        @division = Division.find(params[:id])
    end    

    def update 
        @division = Division.new(params.require(:division).permit(:name))
        if @division.update
            flash[:notice] = "Division was successfully updated."
            redirect_to division_path(@division)
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