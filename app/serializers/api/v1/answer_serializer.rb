module Api
  module V1
    class AnswerSerializer < ActiveModel::Serializer
      attributes :id
      belongs_to :user, serializer: UserSerializer
      belongs_to :option, serializer: OptionSerializer
    end
  end
end
