require 'rails_helper'  #RSpecを利用する際に、共通の設定を書いておくファイル
describe ProductsController do
  describe "GET #show" do
    it "インスタンス変数が期待したものになるか" do
      product = create(:product)
      get :show, params: { id: product }
      # get :show, params: {  id: 1 }
      #binding.pry
      expect(assigns(:product)).to eq product
    end
      # it "商品詳細ページに遷移するか" do
      #   product = create(:product)
      #   get :show, params: {id: product}
      #   expect(response).to render_template :show  
      # end
  end
end