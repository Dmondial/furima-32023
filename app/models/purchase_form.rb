class PurchaseForm
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number

  with_options presence: true do
    # validates :name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    # validates :name_reading, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters."}
    # validates :nickname, format: { with: /\A[a-z0-9]+\z/i, message: "is invalid. Input half-width characters."}
    # 「住所」の郵便番号に関するバリデーション
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 0}
    validates :cuty, format: {with: }
    validates :house_number, format: {with: }
    validates :phone_number, numericality: { only_integer: true }
    
  end

  def save
    # ユーザーの情報を保存し、「user」という変数に入れている
    user = User.create(name: name, name_reading: name_reading, nickname: nickname)
    # 住所の情報を保存
    Address.create(postal_code: postal_code, prefecture: prefecture, city: city, house_number: house_number, building_name: building_name,user_id: user.id)
    # 寄付金の情報を保存
    Donation.create(price: price, user_id: user.id)
  end
end