class Step < ApplicationRecord
  belongs_to :kit
  has_many :tasks
  has_one_attached :photo

  validates :title, presence: true, length: { in: 8..96 }
  validates :content, presence: true, length: { in: 32..650 }
end
