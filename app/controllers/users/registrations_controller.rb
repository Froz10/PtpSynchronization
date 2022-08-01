# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # after_action :create_tacacs_record, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def create
    super
    if @user.save
      TacacsUser.create(user: @user, username: @user.username, password: @user.password)
    end
  end

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

  private

  def user_params
    params.require(:user).permit(:username, :password).to_h
  end
end
