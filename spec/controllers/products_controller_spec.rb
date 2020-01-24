require 'rails_helper'

describe ProductsController, type: :controller  do

  # let(:products){ FactoryBot.create(:product) }
  #   describe 'GET #index' do
  #   it "商品一覧ページに遷移するか" do
  #     get :index
  #     expect(response).to render_template :index
  #   end
  #   it "インスタンス変数が期待したものになるか" do
  #     get :index
  #     expect(assigns(:ladies__products)).to match_array products
  #   end
  # end
    describe "GET #show" do
    # it "インスタンス変数が期待したものになるか" do
    #   product = create(:product)
    #   get :show, params: { id: product }
    #   expect(assigns(:product)).to eq product
    # end
    it "商品詳細ページに遷移するか" do
        # product = create(:product)
        # get :show, params: {id: product}
        # expect(response).to render_template :show  
        get :show, params: {id: 1}
        expect(response).to render_template :show
    end
  end
end

