module Api
  module Toby
    class OptionsController < ApplicationController
      skip_before_action :authenticate_user!

      def create
        @option = Option.new(option_params)
        if @option.save
          default_success_render
        else
          render json: { errors: @option.errors.full_messages }, status: :bad_request
        end
      end


      private
      def option_params
        params.require(:option).permit(:content, :score, :question_id)
      end
    end
  end
end
