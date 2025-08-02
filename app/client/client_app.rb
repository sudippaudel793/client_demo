# frozen_string_literal: true

require_relative './client_concern'

module Client
  class ClientApp # :nodoc:
    attr_accessor :client_data

    def initialize
      @client_data = Client::ClientConcern.client_record
    end

    def search_by_name(query)
      check_for_client_data
      matching_clients = client_data.select do |client|
        # To enable dynamic searching based on different fields, the search field must be included as a parameter. Asks the user for a search field in search_client.rb
        client['full_name']&.downcase&.include?(query.downcase)
      end

      return "No clients found matching '#{query}'." if matching_clients.empty?

      matching_clients
    end

    def search_for_duplicate_email
      check_for_client_data
      client_data.group_by { |client| client['email'] }.select { |_, list| list.count > 1 }.values.flatten
    end

    private

    def check_for_client_data
      'No client data found' unless client_data
    end
  end
end
