module Api
  module Toby

    class CharactersController < ApplicationController
      include Paginable
      skip_before_action :authenticate_user!
      def index
        @characters = Character.all

        render json: @characters
        render_with_pagy(collection: @characters,
                         serializer: ApplicationSerializer)

      end
    end
  end
end