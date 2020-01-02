require 'rails_helper'

RSpec.describe "Stocks", type: :request do
  describe "GET /stocks" do
    it "ストックした場所一覧を取得できる" do
      create(:place, name: "おいしいラーメン屋")
      get stocks_path
      expect(response.body).to include("おいしいラーメン屋")
    end
  end
end
