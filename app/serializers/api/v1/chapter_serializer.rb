module Api
  module V1
    class ChapterSerializer < ActiveModel::Serializer
      attributes :id, :name
      attribute :result, if: -> { current_user.present? }

      def result
        ActiveModelSerializers::SerializableResource.new(current_user, serializer: ResultSerializer, questions: object.questions)
      end

      def current_user
        @instance_options[:current_user]
      end
    end
  end
end
