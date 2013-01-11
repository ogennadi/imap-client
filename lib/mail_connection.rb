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

  # Returns number of e-mails in a mailbox
  # box:String
  #   Name of the mailbox
  def count(box)
    @imap.examine(box)
    imap.search(['ALL']).count
  end

  # Returns the list of mailbox names
  # => [String]
  def boxes
    @imap.list("", "*").map(&:name)
  end

  def logged_in?
    @logged_in
  end

  def imap
    @imap
  end
end
