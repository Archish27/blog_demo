class Post < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5, maximum: 50 }
  validates :body, presence: true, length: { minimum: 10, maximum: 100 }
  belongs_to :user
  has_many :comments, dependent: :destroy
  ransack_alias :title_body_name, :title_or_body_or_user_email_or_user_name
end
