class DivisionsController < ApplicationController

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

end    