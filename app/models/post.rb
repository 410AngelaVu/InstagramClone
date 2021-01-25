class Post < ApplicationRecord
belongs_to :account
has_one_attached :image

before_create :set_active

scope :active, -> { where active: true }

def set_active
self.active = true
	end
end
