This is a very simple, read-only, Gmail IMAP client. It shows a user the list of all the folders in their account, and lets them see the most recent 20 messages in each folder.

## Installation
The code requires Ruby 1.9.3 and Rails 3.2.11 to run. To get started, clone the repo, install all required gems, and then start the Web server.
    
    git clone https://github.com/ogennadi/imap-client.git
    cd imap-client
    bundle install
    rails server

## Browsing the code
The heart of the IMAP traversing code is in `lib/mail_connection.rb`.
