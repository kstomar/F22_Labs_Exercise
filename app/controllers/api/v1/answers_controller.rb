module Api
  module V1
    class AnswersController < Api::V1::ApiController

      def create
        answer = Answer.new(answer_params)
        if answer.save
          render_success_response({answer: single_serializer.new(answer, serializer: AnswerSerializer)})
        else
          render_unprocessable_entity_response(answer)
        end
      end

      private

        def answer_params
          params.require(:answer).permit(:option_id).merge({user_id: current_user.id})
        end
    end
  end
end
