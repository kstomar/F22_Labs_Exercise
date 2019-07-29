module Api
  module V1
    class QuestionsController < Api::V1::ApiController

      def index
        exclude_question_ids = current_user.questions.ids
        questions = Question.where.not(id: exclude_question_ids)
        questions = questions.order('RANDOM()').limit(params[:per]).includes(:options)
        render_success_response({questions: array_serializer.new(questions, serializer: QuestionSerializer)})
      end

      def result
        render_success_response({
          by_exam: array_serializer.new(Exam.all, serializer: ExamSerializer, current_user: current_user),
          by_chapter: array_serializer.new(Chapter.all, serializer: ChapterSerializer, current_user: current_user),
          by_topic: array_serializer.new(Topic.all, serializer: TopicSerializer, current_user: current_user),
          by_subject: array_serializer.new(Subject.all, serializer: SubjectSerializer, current_user: current_user)
        })
      end
    end
  end
end
