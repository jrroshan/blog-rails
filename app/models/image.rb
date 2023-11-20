class Image < ApplicationRecord
  has_many :comments, as: :source, dependent: :destroy
end
