require 'rails_helper'

RSpec.describe Option, type: :model do
  context 'Option validation' do
    it { should belong_to(:question) }
  end
end
