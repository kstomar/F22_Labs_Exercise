require 'rails_helper'

RSpec.describe Subject, type: :model do
  context 'Subject validation' do
    it { should validate_presence_of(:name) }
  end
end
