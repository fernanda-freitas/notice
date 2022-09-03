class Kit < ApplicationRecord
  belongs_to :user
  has_many :steps

  validates :title, presence: true, length: { in: 8..32 }
  validates :description, presence: true, length: { in: 8..64 }
end
