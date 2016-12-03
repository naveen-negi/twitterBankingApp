class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]
	def update
		respond_to do |format|
			if @user.update(user_param)
				sign_in(@user == current_user ? @user : current_user, :bypass=> true)
				format.html {redirect_to @user, notice: 'Your profile was succesfully updated.'}
				format.json {head :no_content}
			else
				format.html {render action: 'edit'}
				format.json {render json: @user.errors, status: :unprocessable_entity}
			end
		end
	end

	def finish_signup
		if request.patch && param[:user]
			if @user.update(user_params)
			  @user.skip_reconfirmation!
			  sign_in(@user, :bypass => true)
			  redirec_to @user, notice: 'Your profile has been succesfully updated.'
			else
				@show_errors = true
			end
		end
	end

	def destroy
		@user.destroy
		respond_to do |format|
			format.html {redirect_to_root_url}
			format.json {head :no_content}
		end
	end

	private
	def set_user
		@user = User.find(params[:id])
	end

	def user_params
		accessible = [:username, :name, :email]
		accessible << [:password, :password_confirmation ] unless params[:user][:password].blank?
		params.require(:user).permit(accessible)
	end
end
