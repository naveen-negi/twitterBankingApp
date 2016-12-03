class SessionsController < Devise::SessionsController
  prepend_before_filter :require_no_authentication, :only => [:create]

  respond_to :json

 def create
      resource =  User.authenticate(params[:user][:name],params[:user][:password])
      return invalid_login_attempt unless resource
      sign_in("user", resource)
      redirect_to :root
  end

  def destroy
  	sign_out(@user)
  end

  protected
  def invalid_login_attempt
  	warden.custom_failure!
  	render json: {
  		:success=>false
  	}, status: 401
  end

  def user_params
    accessible = [ :name, :password ]
    params.require(:user).permit(accessible)
  end

end
