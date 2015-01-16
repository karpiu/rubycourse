require 'github_helper'

class SessionsController < ApplicationController

  def create
    begin
      auth = request.env["omniauth.auth"]
      user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
      session[:user_id] = user.id
      GithubHelper.set_access_token(auth["credentials"]["token"])
      redirect_to root_url, :notice => "Signed in!"
    rescue NonAdminLoginError
      session[:user_id] = nil
      redirect_to root_url, :notice => "Only admin is allowed to sign in!"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out!"
  end
end
