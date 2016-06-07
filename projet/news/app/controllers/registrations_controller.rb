class RegistrationsController < Devise::RegistrationsController
  respond_to :html, :js
  
  
  # POST /users
  def create
	build_resource(sign_up_params)
	
	authorize! :manage, resource
	
	if resource.save
		flash.now[:notice] = "L'utilisateur a été créé avec succès"
	else
		flash.now[:error] = "L'utilisateur n'a pas pu être créé.<br />" + resource.errors.full_messages.join("<br />")
	end
  end

  
  private

  def sign_up_params
    params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation, :medium_id, :role)
  end

  def account_update_params
    params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation, :current_password, :medium_id, :role)
  end
end