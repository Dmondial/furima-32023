class Item < ApplicationRecord
  belongs_to :user
  has_one :category

  with_options presence: true do
    validates :name
    validates :introduction
    validates :price
    validates :category_id
    validates :condition_id
    validates :send_source_id
    validates :send_time_id
  end

end
