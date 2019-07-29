require 'rails_helper'

RSpec.describe User, type: :model do
  context 'User validation' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
  end
end
