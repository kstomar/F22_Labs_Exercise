require 'rails_helper'

RSpec.describe Api::V1::AnswersController, type: :controller do
  describe 'POST#create' do
    it 'Submit Answer' do
      user = create(:user)
      question = create(:question)
      post :create,  params: { answer: { option_id: Option.last.id}, email: user.email}
      response_body = JSON.parse(response.body)
      expect(response_body['success']).to be_truthy
    end

    it 'Validation failed for already submited answer ' do
      user = create(:user)
      question = create(:question)
      create(:answer, user: user, option: Option.last)
      post :create,  params: { answer: { option_id: Option.last.id}, email: user.email}
      response_body = JSON.parse(response.body)
      expect(response_body['success']).to be_falsey
    end
  end
end
