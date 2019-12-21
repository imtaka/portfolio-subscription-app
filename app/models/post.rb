class Post < ApplicationRecord
  validates :subscription_name, presence: true, length:{ maximum: 50 }
  validates :description, presence: true, length:{ maximum: 500 }
  validates :monthly_price, presence: true, numericality:{only_integer:true, greater_than_or_equal_to:0}
  validates :trial_term, presence: true


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