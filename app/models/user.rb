class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]
  
  has_one :address
  has_many :card
  accepts_nested_attributes_for :address
  has_many :products
  has_many :sns_credentials, dependent: :destroy

  #↓うまくいかないので後程
#   has_many :seller_products, class_name: 'Product', :foreign_key => 'seller_id'
#   has_many :buyer_products, class_name: 'Product', :foreign_key => 'buyer_id'

       # バリデーション　↓うまくいかないので後程
       # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
       # VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
       # validates :nickname,                presence: true, length: {maximum: 20}
       # validates :email,                   {presence: true, format: { with: VALID_EMAIL_REGEX }}
       # validates :family_name,               presence: true
       # validates :first_name,              presence: true
       # validates :j_family_name,          presence: true
       # validates :j_first_name,         presence: true
       # validates :birthday_year,          numericality: true
       # validates :birthday_month,         numericality: true
       # validates :birthday_day,           numericality: true
       # validates :phonennumber,            {presence: true, format: { with: VALID_PHONE_REGEX }}

  def self.from_omniauth(auth)
       sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
       # sns認証したことがあればアソシエーションで取得
       # 無ければemailでユーザー検索して取得orビルド(保存はしない)
       user = sns.user || User.where(email: auth.info.email).first_or_initialize(
         nickname: auth.info.name,
           email: auth.info.email
       )
       # userが登録済みの場合はそのままログインの処理へ行くので、ここでsnsのuser_idを更新しておく
       if user.persisted?
         sns.user = user
         sns.save
       end
       user
  end
  
end

