class Post < ApplicationRecord
  has_many :comments, as: :source, dependent: :destroy

  validates :title, :body, presence: true
end
