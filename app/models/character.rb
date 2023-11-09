class Character < ApplicationRecord
  has_many :posts, dependent: :destroy
end
