class Step < ApplicationRecord
  belongs_to :kit

  validates :content, presence: true, length: { in: 32..650 }
  validates :todo, presence: true, length: { in: 6..64 }
end
