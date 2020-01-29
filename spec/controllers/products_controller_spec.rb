require 'rails_helper'
RSpec.describe ProductsController, type: :controller do

  before do
    @user = FactoryBot.create(:user)
  end
describe "#edit" do
  context "as an authorized user" do
    # 正常なレスポンスか？
    it "responds successfully" do

    get :edit, params: {id: @product.id}
    expect(response).to be_success
        end
  # 200レスポンスが返ってきているか？
  it "returns a 200 response" do
    sign_in @user
    get :edit, params: {id: @product.id}
    expect(response).to have_http_status "200"
  end
    end
  end
end

