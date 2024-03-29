require 'net/imap'

class MailConnection
  @logged_in = false
  @box_name   = nil

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
    @imap.status(box, ["MESSAGES"])["MESSAGES"]
  end

  # Returns the list of mailbox names
  # => [String]
  def boxes
    nonfolder_boxes = @imap.list("", "*").keep_if{|b| b.attr.include?(:Hasnochildren)}
    return nonfolder_boxes.map(&:name)
  end

  # => [Net:IMAP:Envelope]
  def email_metas(box, range)
    @imap.examine(box)
    envelope = @imap.fetch(range, "ENVELOPE")
    envelope ? envelope.map{|fd|fd.attr["ENVELOPE"]} : []
  end

  def logged_in?
    @logged_in
  end

  def imap
    @imap
  end
end
