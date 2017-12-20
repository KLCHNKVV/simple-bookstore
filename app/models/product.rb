class Product < ApplicationRecord
  enum genre:
           {
               "Classic" => 0,
               "Crime" => 1,
               "Fable" => 2,
               "Fairy tale" => 3,
               "Fantasy" => 4,
               "Historical fiction" => 5,
               "Horror" => 6,
               "Humor" => 7,
               "Mystery" => 8,
               "Magical realism" => 9,
               "Legend" => 10,
               "Science fiction" => 11,
               "Thriller" => 12,
               "Western" => 13,
               "Realistic fiction" => 14,
               "Biography" => 15,
               "Essay" => 16,
               "Speech" => 17,
               "Memoir" => 18,
               "Mythology" => 19,
               "Folklore" => 20
           }

  has_many :line_items
  has_many :orders, through: :line_items
  before_destroy :ensure_not_referenced_by_any_line_item

  validates :price, :title, :description, :image_url, :genre, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :title, :uniqueness => true
  validates :image_url, allow_blank: true, format: {
      with: %r{\.(gif|jpg|png|jpeg)\Z}i,
      message: 'Must be a URL for GIF, JPG, JPEG or PNG image.'
  }

  def self.search(search)
    if search
      find(:all, :conditions => [':title LIKE ?', "%#{search}"])
    else
      Product.all
    end
  end

  private

  def ensure_not_referenced_by_any_line_item
    unless line_items.empty?
      errors.add(:tbase, 'Line Item Present.')
      throw :abort
    end
  end
end
