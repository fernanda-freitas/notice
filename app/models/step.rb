class Step < ApplicationRecord
  belongs_to :kit
  has_many :tasks

  validates :content, presence: true, length: { in: 32..650 }
end
