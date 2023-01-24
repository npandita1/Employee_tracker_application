class Employees::InvitationsController < Devise::InvitationsController
  skip_before_action :authenticate_employee!, only: [:edit, :update]
  before_action :configure_permitted_parameters, only: [:new, :create]
  before_action :configure_permition_parameters, only: [:edit, :update]

  protected

  #Permit the new params here.
  def configure_permition_parameters
    devise_parameter_sanitizer.permit(:accept_invitation, keys: [:name, :username, :division_id, :designation_id, :master_role_id])
  end

  def configure_permitted_parameters 
    devise_parameter_sanitizer.permit(:invite, keys: [:name, :username, :division_id, :designation_id, :master_role_id])
  end  

end