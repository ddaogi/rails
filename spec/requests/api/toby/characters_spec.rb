require 'rails_helper'

RSpec.describe "API: Toby: Characters", type: :request do
  describe "GET /index" do
    let!(:characters) { FactoryBot.create_list(:character, 3) }
    let(:json_response) { JSON.parse(response.body) }

    before { get api_toby_characters_path }

    it " HTTP 응답 체크 " do
      expect(response).to have_http_status(:success)
    end

    it " 캐릭터가 3개인지 확인 " do
      expect(json_response.count).to eq(3)
      puts JSON.pretty_generate(json_response)
    end
  end
end
