class Post < ApplicationRecord
belongs_to :account
has_one_attached :image

scope :active, -> { where active: true }
end
