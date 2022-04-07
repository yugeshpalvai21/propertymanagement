require 'rails_helper'

RSpec.describe Property, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:address) }
  end
end
