require 'rails_helper'

RSpec.describe Api::V1::ExamsController, type: :controller do

  describe 'GET#Index' do
    it 'List Of Exams' do
      user = create(:user)
      create_list(:question, 12)
      get :index
      response_body = JSON.parse(response.body)
      expect(response_body['data']).to_not be_empty
    end
  end
end
