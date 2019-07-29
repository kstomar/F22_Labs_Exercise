module Api
  module V1
    class ExamSerializer < ActiveModel::Serializer
      attributes :id, :name
      attribute :subjects, unless: -> { current_user.present? }
      attribute :result, if: -> { current_user.present? }

      def subjects
        ActiveModel::Serializer::CollectionSerializer.new(object.subjects, serializer: SubjectSerializer)
      end

      def result
        ActiveModelSerializers::SerializableResource.new(current_user, serializer: ResultSerializer, questions: object.questions)
      end

      def current_user
        @instance_options[:current_user]
      end
    end
  end
end
