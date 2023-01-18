# frozen_string_literal: true

class Employees::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  before_action :configure_profile_update_params, only: [:update_profile]
  before_action :identify_employee, :only => [:edit_profile]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  def edit_profile
    @edit_employee = Employee.find(params[:id])
  end 
  
  def update_profile 
    @edit_employee = Employee.find(params[:id])
    if @edit_employee.update_without_password(params.require(:employee).permit(:name, :username, :email, :division_id, :designation_id, :division_id, :master_role_id))
      flash[:notice] = "Profile was successfully updated!"
      if @edit_employee == current_employee 
        redirect_to employee_root_path
      else  
        redirect_to employees_list_path
      end  
    else  
      flash[:alert] = "Profile can not be updated!"  
      render 'edit_profile'
    end  
  end  

  protected

  def identify_employee 
    unless current_employee.master_role.name == "HR Manager"
        flash[:alert] = "You do not have access to this section" 
        redirect_to employee_root_path 
    end 
  end       

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_profile_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :username, :email, :division_id, :designation_id,
                                      :division_id, :master_role_id])
  end
  
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])    
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end