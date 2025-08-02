# frozen_string_literal: true

require_relative './client/client_app'
require 'bundler/setup'
Bundler.require(:default)

puts 'Enter the name of the client you want to search for:'
search_param = gets.chomp
results = Client::ClientApp.new.search_by_name(search_param.to_s)
puts 'Matching clients:' if results.is_a?(Array)

puts results
