class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 16 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  def full_name
	"#{first_name} #{last_name}"
  end
end
