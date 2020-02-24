module Api
  module V1
    class QuestionsController < ApplicationController
      before_action :authorize
      after_action :increment_api_count

      def index
        questions = Question.public_questions

        render json: questions
      end

      def show
        question = Question.public_questions.find_by(id: params[:id])

        render json: question
      end
    end
  end
end
