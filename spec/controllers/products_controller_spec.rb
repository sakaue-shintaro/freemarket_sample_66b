require 'rails_helper'

describe ProductsController, type: :controller  do

    describe 'GET #index' do
    it "商品一覧ページに遷移するか" do
      get :index
      expect(response).to render_template :index
    end
    it "インスタンス変数が期待したものになるか" do
      products = FactoryBot.create_list(:product, 1)
      get :index
      expect(assigns(:products)).to eq products 
    end
  end
end