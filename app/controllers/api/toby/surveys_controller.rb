module Api
  module Toby
    class SurveysController < ApplicationController
      skip_before_action :authenticate_user!
      # 설문지 생성
      def create
        @survey = Survey.new(survey_params)
        if @survey.save
          render json: { survey: @survey, message: 'Survey created successfully' }, status: :ok
        else
          render json: { errors: @survey.errors.full_messages }, status: :bad_request
        end
      end

      def destroy
        @survey = Survey.find(params[:id])
        if @survey.destroy
          default_success_render
        else
          render json: { errors: @survey.errors.full_messages }, status: :bad_request
        end
      end

      def show
        @survey = Survey.find(params[:id])
        render json: { survey: @survey, message: 'Survey showed successfully' }, status: :ok
      end

      def index
        @survey = Survey.all
        render json: { survey: @survey, message: 'Survey index successfully' }, status: :ok
      end

      private
      def survey_params
        # params.require(:survey).permit(:title, :description)
        params.require(:survey).permit(:title, :description)
      end
    end
  end
end
