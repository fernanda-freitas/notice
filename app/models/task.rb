class Task < ApplicationRecord
  belongs_to :step

  validates :content, presence: true, length: { in: 6..64 }
end
