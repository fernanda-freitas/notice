module Intake
  class Title
    include ActiveModel::Model
    attr_accessor :title
    validates :title, presence: true, length: { in: 8..96 }
  end
end
