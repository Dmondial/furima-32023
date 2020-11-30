class Item < ApplicationRecord
  belongs_to :user
  has_one :category
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :introduction

    with_options numericality: { other_than: 0 , message:"Select"} do
      validates :category_id 
      validates :condition_id 
      validates :send_source_id 
      validates :send_time_id
    end
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"} 
  end
  validates :price, numericality: { only_integer: true, message: "Half-width number"}

end
