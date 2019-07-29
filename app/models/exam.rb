class Exam < ApplicationRecord
  validates :name, presence: true

  has_many :subjects, dependent: :destroy
  has_many :topics, through: :subjects
  has_many :chapters, through: :topics
  has_many :questions, through: :chapters
end
