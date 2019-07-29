module Api
  module V1
    class SubjectSerializer < ActiveModel::Serializer
      attributes :id, :name
      attribute :topics, unless: -> { current_user.present? }
      attribute :result, if: -> { current_user.present? }

      def result
        ActiveModelSerializers::SerializableResource.new(current_user, serializer: ResultSerializer, questions: object.questions)
      end

      def current_user
        @instance_options[:current_user]
      end

      def topics
        ActiveModel::Serializer::CollectionSerializer.new(object.topics, serializer: TopicSerializer)
      end
    end
  end
end
