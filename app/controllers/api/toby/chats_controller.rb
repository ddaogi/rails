#frozen_string_literal: true

module Api
  module Toby
    class ChatsController < ApplicationController

      skip_before_action :authenticate_user!

      def create

      end
    end
  end
end