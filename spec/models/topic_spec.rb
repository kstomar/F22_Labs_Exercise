require 'rails_helper'

RSpec.describe Topic, type: :model do
  context 'Topic validation' do
    it { should validate_presence_of(:name) }
  end
end
