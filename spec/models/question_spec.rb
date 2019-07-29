require 'rails_helper'

RSpec.describe Question, type: :model do
  context 'After create' do
    it 'set skip option' do
      user = create(:user)
      question = create(:question)
      expect(question.options.first.name).to eq 'skiped'
    end
  end
end
