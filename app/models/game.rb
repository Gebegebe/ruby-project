class Game < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_one :genre
  validates :title, presence: true

  def is_rented?
    return is_rented == true
  end
end
