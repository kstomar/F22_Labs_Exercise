require 'rails_helper'

RSpec.describe Chapter, type: :model do
  context 'Chapter validation' do
    it { should validate_presence_of(:name) }
  end
end
