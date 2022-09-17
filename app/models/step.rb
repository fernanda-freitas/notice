class Step < ApplicationRecord
  belongs_to :kit
  has_many :tasks
  has_one_attached :photo

  # validates :title, presence: true, length: { in: 8..96 }
  # validates :content, presence: true, length: { in: 32..650 }

  module Intake
    class Title
      include ActiveModel::Model
      attr_accessor :title
      validates :title, presence: true, length: { in: 8..96 }
    end

    class Content
      include ActiveModel::Model
      attr_accessor :content
      validates :content, presence: true, length: { in: 32..650 }
    end
  end
end
