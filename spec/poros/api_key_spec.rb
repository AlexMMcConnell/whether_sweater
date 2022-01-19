require 'rails_helper'

describe ApiKey do
  describe 'self.new_key' do
    it 'creates a unique 24 character key' do
      expected = ApiKey.new_key

      expect(expected.length).to eq(24)
      expect(User.find_by(api_key: expected)).to be nil
    end
  end
end
