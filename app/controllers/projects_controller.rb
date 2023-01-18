class ProjectsController < ApplicationController
    before_action :identify_if_manager, except: [:index, :show]
    before_action :identify_employee, only: [:index, :show]

    def index 
        @projects = Project.all
    end    

    def new 
        @project = Project.new
    end  
    
    def show 
        @project = Project.find(params[:id])
    end 

    def create 
        @project = Project.new(params.require(:project).permit(:name, :description))
        if @project.save
            flash[:notice] = "Project was successfully created."
            redirect_to project_path(@project)
        else 
            render 'new'    
        end    
    end  
    
    def edit
        @project = Project.find(params[:id])
    end 

    def update 
        @project = Project.new(params.require(:project).permit(:name, :description))
        if @project.update
            flash[:notice] = "Project was successfully updated."
            redirect_to project_path(@project)
        else 
            render 'edit'    
        end    
    end 

    def assign_to_project  
        @projects = Project.all
    end   
    
    def remove_from_project  
        @projects = Project.all
    end    

    private

    def identify_if_manager
        unless current_employee.master_role.name == "Project Manager"
            flash[:alert] = "You do not have access to this section" 
            redirect_to employee_root_path 
        end 
    end 

    def identify_employee 
        unless current_employee.master_role.name == "Project Manager" || current_employee.master_role.name == "Employee"
            flash[:alert] = "You do not have access to this section" 
            redirect_to employee_root_path 
        end 
    end 

end  