require 'net/imap'

class MailConnection
  @logged_in = false

  def initialize(username, password)
    @imap = Net::IMAP.new('imap.gmail.com', ssl: true)
    @imap.login(username, password)
    @logged_in = true
  rescue Net::IMAP::NoResponseError => e
    return self
  end

  def inbox_count
    @imap.examne("INBOX")
    imap.search(['ALL']).count
  end

  def logged_in?
    @logged_in
  end

  def imap
    @imap
  end
end
