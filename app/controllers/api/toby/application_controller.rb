module Api
  module Toby
    class ApplicationController < ActionController::API
      before_action :authenticate_user!

      RESPONSE_TYPE = {
        success: "success",
        error: "error",
        alert: "alert",
        toast: "info"
      }.freeze

      def default_success_render
        render status: :ok, json: default_render_json
      end

      def default_render_json
        {
          code: 200,
          type: RESPONSE_TYPE[:success],
          message: "ok",
          title: nil
        }
      end
    end
  end
end