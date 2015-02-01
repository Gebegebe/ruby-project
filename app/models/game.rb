class Game < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_one :genre
  validates :title, presence: true

  def is_rented?
    return is_rented == true
  end

  def user_rented
    rented = RentTable.first(:game_id => id)
    return rented
  end

  def rent(user_id)
    rented = RentTable.new()
    rented.user_id = user_id
    rented.game_id = id
    rented.save
  end

  def unrent
    RentTable.where(:game_id => self.id).destroy_all
  end
end
