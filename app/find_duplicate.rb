# frozen_string_literal: true

require_relative './client/client_app'
require 'bundler/setup'
Bundler.require(:default)

duplicate_email_clients = Client::ClientApp.new.search_for_duplicate_email

if duplicate_email_clients.nil?
  puts 'All the email are unique in the record.'
else
  puts 'Duplicate email found:'
  puts duplicate_email_clients
end
