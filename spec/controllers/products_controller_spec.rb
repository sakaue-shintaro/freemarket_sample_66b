require 'rails_helper'
RSpec.describe ProductsController, type: :controller do

  # describe ProductsController, type: :controller  do
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
          get :show, params: {id: 1}
          expect(response).to render_template :show
      end
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
