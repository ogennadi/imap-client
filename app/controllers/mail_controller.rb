class MailController < ApplicationController
  PER_PAGE = 20

  def index
    redirect to mail_box_path("INBOX")
  end

  def box
    mc        = $mail_connection
    box_name  = CGI.unescape(params[:box])

    if !(mc && mc.logged_in?)
      redirect_to root_path,
        alert: "Your session was disconnected. Please login again"
    else
      @count          = mc.count(box_name)
      @boxes          = mc.boxes
      @emails_on_page = [@count, PER_PAGE].min
      @email_metas    =
        @count == 0 ? [] : mc.email_metas(box_name, 1..@emails_on_page)
    end
  end
end
