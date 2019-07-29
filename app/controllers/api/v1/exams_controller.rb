module Api
  module V1
    class ExamsController < Api::V1::ApiController

      def index
        exams = Exam.all.includes(subjects: [topics: :chapters])
        render_success_response({exams: array_serializer.new(exams, serializer: ExamSerializer)})
      end

    end
  end
end
