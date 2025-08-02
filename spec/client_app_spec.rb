# frozen_string_literal: true

require_relative '../app/client/client_app'

# rubocop:disable Metrics/BlockLength
RSpec.describe Client::ClientApp do
  before do
    @client = Client::ClientApp.new
  end

  describe 'Search by name' do
    it "should only return one partial matching names when searching parameter is 'emi'" do
      matching_client = @client.search_by_name('emi')
      expect(matching_client).to eq([{ 'id' => 5, 'full_name' => 'Emily Brown', 'email' => 'emily.brown@aol.com' }])
    end

    it "should not return any client data when search parameter is 'sud'" do
      matching_client = @client.search_by_name('sud')
      expect(matching_client).to eq("No clients found matching 'sud'.")
    end

    it 'should return all client data when search parameter is empty string' do
      matching_client = @client.search_by_name('')
      expect(matching_client.count).to eq(35)
    end
  end

  describe '#duplicate email' do
    it 'should return two client and list all client whose email is duplicate' do
      duplicate_clients = @client.search_for_duplicate_email
      expect(duplicate_clients.count).to eq(2)
      expect(duplicate_clients).to eq([{ 'id' => 2, 'full_name' => 'Jane Smith', 'email' => 'jane.smith@yahoo.com' },
                                       { 'id' => 15, 'full_name' => 'Another Jane Smith',
                                         'email' => 'jane.smith@yahoo.com' }])
    end

    it 'should return four client and list all client whose email is duplicate' do
      @client.client_data.last['email'] = 'samuel.turner@outlook.com'
      duplicate_clients = @client.search_for_duplicate_email
      expect(duplicate_clients.count).to eq(4)
      expect(duplicate_clients).to eq([{ 'id' => 2, 'full_name' => 'Jane Smith', 'email' => 'jane.smith@yahoo.com' },
                                       { 'id' => 15, 'full_name' => 'Another Jane Smith',
                                         'email' => 'jane.smith@yahoo.com' },
                                       { 'id' => 34, 'full_name' => 'Samuel Turner',
                                         'email' => 'samuel.turner@outlook.com' },
                                       { 'id' => 35, 'full_name' => 'Victoria Phillips',
                                         'email' => 'samuel.turner@outlook.com' }])
    end

    it 'should return empty array with no duplicate email' do
      @client.client_data.find { |client| client['id'] == 2 }['email'] = 'sudip793@gmail.com'
      duplicate_clients = @client.search_for_duplicate_email
      expect(duplicate_clients.count).to eq(0)
      expect(duplicate_clients).to eq([])
    end
  end
end
# rubocop:enable Metrics/BlockLength
