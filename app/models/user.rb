class User < ApplicationRecord
  validates :name, :email, presence: true

  has_many :answers
  has_many :questions, through: :answers

  def correct_answers(all_questions)
    unskipped_answers.where(options: {correct: true, question_id:  all_questions.ids}).count
  end

  def wrong_answers(all_questions)
    unskipped_answers.where(options: {correct: false, question_id:  all_questions.ids}).count
  end

  def skipped_questions(all_questions)
    answers.includes(:option).where(options: {name: 'skiped', question_id:  all_questions.ids}).count
  end

  def unseen_questions(all_questions)
    all_questions.where.not(id: questions.ids).count
  end

  def unskipped_answers
    answers.includes(:option).where.not(options: {name: 'skiped'})
  end
end
