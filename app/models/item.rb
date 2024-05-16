class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :shipping_day
  has_many_attached :images
  has_one :order

  # 空の投稿を保存できないようにする
  validates :item_name, :price, :description, :images, presence: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  # 5枚以上の画像投稿は弾くようにする
  validates :images, length: { minimum: 1, maximum: 5, message: 'は1枚以上5枚以下にしてください' }
  # ジャンルの選択が「---」の時は保存できないようにする
  validates :category_id, :condition_id, :shipping_cost_id, :prefecture_id, :shipping_day_id,
            numericality: { other_than: 1, message: "can't be blank" }
end
