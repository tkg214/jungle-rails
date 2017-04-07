class Product < ActiveRecord::Base

  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  belongs_to :category
  has_many :line_items
  has_many :orders
  has_many :reviews

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :category, presence: true

  def is_sold_out?
    quantity == 0
  end

  def average_rating
    if reviews.size.zero?
      'Not yet rated'
    else
      "Overall rating: #{(reviews.map { |r| r[:rating].to_f }.sum / reviews.size).round(1)}/5"
  end
end

end
