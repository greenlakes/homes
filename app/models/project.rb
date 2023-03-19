class Project < ApplicationRecord
  has_many :comments

  validates :name, presence: true

  enum status: { active: 0, completed: 1, on_hold: 3, archived: 4 }

end

