class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :prefecture
  belongs_to :shipping_time
  belongs_to :shipping_fee

  belongs_to :user
  has_one_attached :image

  validates :name,             presence: true
  validates :content,          presence: true
  validates :category_id,      numericality: { other_than: 1 , message: "can't be blank"}
  validates :status_id,        numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_fee_id,  numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id,    numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_time_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price,            presence: true
  validates :image,            presence: true

end