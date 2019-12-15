class Post < ApplicationRecord
  has_many :post_tag_relations, dependent: :destroy
  has_many :tags, through: :post_tag_relations
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  has_one_attached :post_image

  def self.search(search)
    if search
      Post.where(['subscription_name LIKE ?', "%#{search}%"])
    else
      Post.all
    end
  end

end