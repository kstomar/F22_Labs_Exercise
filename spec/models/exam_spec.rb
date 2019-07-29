require 'rails_helper'

RSpec.describe Exam, type: :model do
  context 'Exam validation' do
    it { should validate_presence_of(:name) }
  end
end
