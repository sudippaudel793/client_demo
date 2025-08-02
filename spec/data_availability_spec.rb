# frozen_string_literal: true

RSpec.describe 'Test Data Availability' do
  describe "The url 'https://appassets02.shiftcare.com/manual/clients.json'" do
    it 'is always reachable and returns status 200 and data is always available to test' do
      response = HTTParty.get('https://appassets02.shiftcare.com/manual/clients.json')
      expect(response.code).to eq(200)
      expect(JSON.parse(response.body).count).to be > 0
    end
  end
end
