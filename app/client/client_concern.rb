# frozen_string_literal: true

module Client
  module ClientConcern # :nodoc:
    def self.client_record
      # To accept any JSON file, need to pass the file link in parameter
      response = HTTParty.get('https://appassets02.shiftcare.com/manual/clients.json')
      if response.code == 200
        JSON.parse(response.body)
      else
        puts 'There is a problem fetching a client data. please try again later'
      end
    rescue SocketError => e
      puts "An error occurred: #{e.class} - #{e.message}"
    end
  end
end
