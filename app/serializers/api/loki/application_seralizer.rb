module Api
  module Loki
    class ApplicationSerializer
      attributes :id, :created_at, :updated_at

      attribute :id do
        object.id.to_s
      end

      attribute :created_at do
        object.created_at.to_i
      end

      attribute :updated_at do
        object.updated_at.to_i
      end
    end
  end
end