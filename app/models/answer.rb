class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :option
  has_one :question, through: :option

  validate :validate_previous_answers

  private

  def validate_previous_answers
    if previous_answers.any?
      errors.add(:option, 'You have already submitted answer for this question.')
    end
  end

  def previous_answers
    Answer.where(user: user).includes(option: :question).where(questions: {id: option.question.id})
  end
end
