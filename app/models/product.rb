class Product < ApplicationRecord
  has_many :line_items
  has_many :orders, through: :line_items
  before_destroy :ensure_not_referenced_by_any_line_item

  validates :price, :title, :description, :image_url, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :title, :uniqueness => true
  validates :image_url, allow_blank: true, format: {
      with: %r{\.(gif|jpg|png|jpeg)\Z}i,
      message: 'Must be a URL for GIF, JPG, JPEG or PNG image.'
  }

  private

  def ensure_not_referenced_by_any_line_item
    unless line_items.empty?
      errors.add(:tbase, 'Line Item Present.')
      throw :abort
    end
  end
end
