class Step < ApplicationRecord
  belongs_to :kit
  has_many :tasks
  has_one_attached :photo

  attr_accessor :form_step
  mattr_accessor :form_steps do
  	%w(title content media)
  end

  validates :title, presence: true, length: { in: 8..96 },
    if: -> { required_for_step?(:title) }
  validates :content, presence: true, length: { in: 32..650 },
    if: -> { required_for_step?(:content) }

  def required_for_step?(step)
    # All fields are required if no form multistep is present
    return true if form_step.nil?

    # All fields from previous steps are required if the
    # step parameter appears before or we are on the current step
    return true if self.form_steps.index(step.to_s) <= self.form_steps.index(form_step)
  end
end
