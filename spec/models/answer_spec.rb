require 'rails_helper'

RSpec.describe Answer, type: :model do

  context 'Answer validation' do

    it 'Already submitted answer' do
      user = create(:user)
      question = create(:question)
      create(:answer, user: user, option: Option.last)
      answer = build(:answer, user: user, option: Option.first)
      expect(answer.valid?).to be_falsey
      expect(answer.errors.full_messages).to eq ["Option You have already submitted answer for this question."]
    end
  end
end
