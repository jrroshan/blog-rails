class Image < ApplicationRecord
  has_many :comments, as: :source, dependent: :destroy
  has_one_attached :file
end
