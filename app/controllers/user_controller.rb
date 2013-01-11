class UserController < ApplicationController
  def login
    mc = MailConnection.new(params[:username], params[:password])

    unless mc.logged_in?
      redirect_to root_path, notice: "Invalid login"
    end
  end
end
