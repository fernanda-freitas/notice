module Intake
  class Content
    include ActiveModel::Model
    attr_accessor :content
    validates :content, presence: true, length: { in: 32..650 }
  end
end
