FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password = "abc123"
    # ↓英数混同になる方法を考え中
    # password = ""
    # while password.include?(/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i) do
    #   password = Faker::Internet.password(min_length: 6)
    # end
    password              { password }
    password_confirmation { password }
    last_name  { '山田' }
    first_name { '太郎' }
    last_name_kana { 'ヤマダ' }
    first_name_kana { 'タロウ' }
    birthday { 20_001_212 }
  end
end
