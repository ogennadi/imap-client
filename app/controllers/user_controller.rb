class UserController < ApplicationController
  def login
    mc = MailConnection.new(params[:username], params[:password])

    if mc.logged_in?
      $mail_connection = mc
      redirect_to box_path("INBOX")
    else
      redirect_to root_path, alert: "Invalid login"
    end
  end
end
