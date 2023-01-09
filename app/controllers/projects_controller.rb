class ProjectsController < ApplicationController

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

end  