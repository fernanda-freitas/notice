class Task < ApplicationRecord
  belongs_to :step

  validates :content, presence: true
end
