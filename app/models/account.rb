class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 16 }
  validates :first_name, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 16 }
  validates :last_name, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 16 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :likes
  has_many :comments
  has_one_attached :image
  def full_name
	"#{first_name} #{last_name}"
  end

  def total_followers 
    Follower.where(following_id: self.id).count
    
  end

  def total_following
    Follower.where(follower_id: self.id).count
  end

end
