class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :project

  accepts_nested_attributes_for :project

  validates :content, presence: true
end
