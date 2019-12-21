class Comment < ApplicationRecord
  validates :body, length:{ maximum: 500 }

  belongs_to :post
  belongs_to :user
end
