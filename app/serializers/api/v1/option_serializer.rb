module Api
  module V1
    class OptionSerializer < ActiveModel::Serializer
      attributes :id, :name
    end
  end
end

