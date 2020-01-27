require 'rails_helper'

describe ProductsController, type: :controller  do
  # メンバーが検証中
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
    it "インスタンス変数が期待したものになるか" do
      product = create(:product)
      get :show, params: { id: product }
      expect(assigns(:product)).to eq product
    end
    it "商品詳細ページに遷移するか" do
        # product = create(:product)
        # get :show, params: {id: product}
        # expect(response).to render_template :show  
        get :show, params: {id: 1}
        expect(response).to render_template :show
    end
      describe 'delete #destroy' do
        before do
          @product = create(:product)
        end
        context '存在するユーザーの場合' do
          it 'リクエストは302 リダイレクトとなること' do
            delete :destroy, id: @product.id
            expect(response.status).to eq 302
          end
          it 'データベースから要求された商品が削除されること' do
            expect{
              delete :destroy,{ id: @product.id}
            }.to change(Product,:count).by(-1)
        end
      end
    end
  end
end