class MailController < ApplicationController
  def index
    redirect to mail_box_path("INBOX")
  end

  def box
    if !($mail_connection && $mail_connection.logged_in?)
      redirect_to root_path, alert: "Your session was disconnected. Please login again"
    end
    
    mc = $mail_connection
    @count = mc.count(params[:box])
    @boxes = mc.boxes
  end
end
