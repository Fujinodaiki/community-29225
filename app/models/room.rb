class Room < ApplicationRecord
  has_many :room_users
  has_many :users, through: :room_users
  has_many :messages
  has_many :applys

  def search(search)
    if search != ""
      Room.where('text LIKE(?)',"%#{search}%")      
    else
      Room.all
    end    
  end
end