class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :shipping_day
  has_one_attached :image

  # 空の投稿を保存できないようにする
  validates :item_name, :price, :description, :image, presence: true

  # ジャンルの選択が「---」の時は保存できないようにする
  validates :category_id, :condition_id, :shipping_cost_id, :prefecture_id, :shipping_day_id, numericality: { other_than: 1, message: "can't be blank" }
end
