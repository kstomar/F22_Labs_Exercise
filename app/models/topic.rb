class Topic < ApplicationRecord
  validates :name, presence: true

  belongs_to :subject
  has_many :chapters
  has_many :questions, through: :chapters
end
