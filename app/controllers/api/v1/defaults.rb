require_relative "helpers/application_helpers"

module API
  module V1
    module Defaults
      # if you're using Grape outside of Rails, you'll have to use Module#included hook
      extend ActiveSupport::Concern

      included do
        version "v1"
        format :json
        formatter :json, Grape::Formatter::Roar

        helpers ApplicationHelpers

        # use Grape::Knock::Authenticable
        # rescue_from Grape::Knock::ForbiddenError do
        #   error!('403 Forbidden', 403)
        # end

        # global handler for simple not found case
        rescue_from ActiveRecord::RecordNotFound do |e|
          Rails.logger.error e.inspect
          Rails.logger.error e.backtrace
          error_response(message: e.message, status: 404)
        end

        rescue_from ActiveRecord::RecordInvalid do |e|
          Rails.logger.error e.inspect
          Rails.logger.error e.backtrace
          error_response(message: e.message, status: 409)
        end

        rescue_from RestClient::Exception do |e|
          if e.response.present?
            e.message = "#{e.message} #{e.response.to_s}"
            defined?(Bugsnag) && Bugsnag.notify(e)
            error_response(message: e.response.to_s, status: 400)
          else
            defined?(Bugsnag) && Bugsnag.notify(e)
            error_response(message: e.message, status: 400)
          end
        end

        # rescue_from :all do |e|
        #   if Rails.env.development?
        #     error_response(message: e.message, status: 500)
        #     Rails.logger.error e.inspect
        #     Rails.logger.error e.backtrace
        #   else
        # Raven.capture_exception(e)
        # error_response(message: "Internal server error", status: 500)
        #   end
        # end

        # global exception handler, used for error notifications
        # rescue_from :all do |e|
        #   if Rails.env.development?
        #     raise e
        #   else
        #     # Raven.capture_exception(e)
        #     # error_response(message: "Internal server error", status: 500)
        #   end
        # end

      end
    end
  end
end
