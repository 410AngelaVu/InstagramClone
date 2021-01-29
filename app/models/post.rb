class Post < ApplicationRecord
belongs_to :account

has_many :likes
has_many :comments
has_one_attached :image


before_create :set_active

scope :active, -> { where active: true }

def total_likes
0
	end

private

def set_active
self.active = true
	end
end
