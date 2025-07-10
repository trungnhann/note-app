module Api
  module V1
    class BaseController < ApplicationController
      rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found
      rescue_from ActionController::ParameterMissing, with: :handle_bad_request
      rescue_from Pundit::NotAuthorizedError, with: :handle_unauthorized

      include Pundit::Authorization
      include JwtAuthenticatable

      private

      def handle_not_found(exception)
        render_error('The requested resource was not found', :not_found, errors: [exception.message])
      end

      def handle_bad_request(exception)
        render_error('Required parameters are missing or invalid', status: :bad_request, error: exception.message)
      end

      def handle_unauthorized
        render_error('You are not authorized to perform this action', :forbidden)
      end

      def render_success(data = {}, message = 'Success', status = :ok)
        render json: {
          success: true,
          message: message,
          data: data
        }, status: status
      end

      def render_error(message = 'Error', status = :bad_request, errors = {})
        render json: {
          success: false,
          message: message,
          errors: errors
        }, status: status
      end
    end
  end
end
