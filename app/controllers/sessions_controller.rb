class SessionsController < ApplicationController
  def new
    form = Users::SignupForm.new
  end

  def create
    form = Users::SignupForm.new(session_params)

    form.submit! do |on|
      on.success do |_|
        redirect_to dashboard_path
      end

      on.failure do
        render :new locals: { form: form }
      end
    end
  end

  def destroy
  end

  private

  def session_params

  end
end
