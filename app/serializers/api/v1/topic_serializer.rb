module Api
  module V1
    class TopicSerializer < ActiveModel::Serializer
      attributes :id, :name
      attribute :chapters, unless: -> { current_user.present? }
      attribute :result, if: -> { current_user.present? }

      def result
        ActiveModelSerializers::SerializableResource.new(current_user, serializer: ResultSerializer, questions: object.questions)
      end

      def current_user
        @instance_options[:current_user]
      end

      def chapters
        ActiveModel::Serializer::CollectionSerializer.new(object.chapters, serializer: ChapterSerializer)
      end
    end
  end
end
