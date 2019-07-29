class Question < ApplicationRecord
  belongs_to :chapter
  has_many :options
  enum category: [:easy, :medium, :hard]

  after_create :set_skip_option

  def set_skip_option
    options.create(name: 'skiped')
  end
end
