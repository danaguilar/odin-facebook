class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts
  has_many :comments
  has_and_belongs_to_many :frienders, class_name: "User", foreign_key: "friender_id", association_foreign_key: "friend_id", join_table: :friends
  has_and_belongs_to_many :friends, class_name: "User", foreign_key: "friend_id", association_foreign_key: "friender_id", join_table: :friends


  def role_image
    case player_role
    when "tank"
      return "IconTank.png"
    when "support"
      return "IconSupport.png"
    when "specialist"
      return "IconSpecialist.png"
    when "assassin"
      return "IconAssassin.png"
    end
  end

  def add_friend(friend_user)
    self.friends << friend_user
    self.frienders << friend_user
  end

  def delete_friend(friend_user)
    #To be implemented later
  end
end
