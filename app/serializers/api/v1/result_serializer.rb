module Api
  module V1
    class ResultSerializer < ActiveModel::Serializer
      attributes :id, :correct_answers, :wrong_answers, :skipped_questions, :unseen_questions

      def correct_answers
        object.correct_answers(all_questions).to_s + '%'
      end

      def wrong_answers
        object.wrong_answers(all_questions).to_s + '%'
      end

      def skipped_questions
        object.skipped_questions(all_questions).to_s + '%'
      end

      def unseen_questions
        object.unseen_questions(all_questions).to_s + '%'
      end

      def all_questions
        @instance_options[:questions]
      end
    end
  end
end
