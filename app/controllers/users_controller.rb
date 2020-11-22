class UsersController < ApplicationController
  def new
		form = Users::SignupForm.new
		render locals: { form: form }
  end

	def create
		form = Users::SignupForm.new(signup_form_params)

		binding.pry

    form.submit! do |on|
			on.success do |_|
				binding.pry
        return redirect_to dashboard_show_path
      end

			on.failure do
				binding.pry
        return render :new, locals: { form: form }
      end
    end
  end

	def show

	end

	def edit

	end

	def update

	end

	def destroy

	end

	private

	def signup_form_params
		params.require(:users_signup_form).permit(:full_name, :email, :username, :password, :password_confirmation)
	end

	def user_params
		params.require(:user).permit(:full_name, :email, :username, :password, :password_confirmation)
	end
end