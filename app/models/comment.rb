class Comment < ApplicationRecord
  belongs_to :source, polymorphic: true
  # belongs_to :comment, polymorphic: true
end
