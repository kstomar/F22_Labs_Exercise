require 'rails_helper'

RSpec.describe Api::V1::QuestionsController, type: :controller do

  describe 'GET#Index' do
    it 'List Of Questions' do
      user = create(:user)
      create_list(:question, 12)
      get :index, params: { email: user.email}
      response_body = JSON.parse(response.body)
      expect(response_body['data']).to_not be_empty
    end
  end
end
