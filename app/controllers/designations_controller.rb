class DesignationsController < ApplicationController

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

end    