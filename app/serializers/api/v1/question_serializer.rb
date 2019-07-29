module Api
  module V1
    class QuestionSerializer < ActiveModel::Serializer
      attributes :id, :name
      has_many :options, serializer: OptionSerializer
    end
  end
end
