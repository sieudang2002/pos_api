require "roar/representer"
require "roar/json"
require "roar/json/hal"
require "grape-swagger"

module API
  module V1
    class Base < Grape::API
      version "v1", using: :path

      default_format :json
      format :json
      formatter :json, Grape::Formatter::Roar

      desc "Returns the current API version, v1."
      get do
        {
          "version": "v1",
          "_links": {
            "self": {
              "href": "#{request.base_url}/v1",
            },
          },
        }
      end

      desc "Returns pong.", hidden: true
      get "ping" do
        { ping: "pong" }
      end

      mount API::V1::Tickets

      add_swagger_documentation format: :json,
                                base_path: "/api/",
                                doc_version: "v1",
                                hide_documentation_path: true,
                                info: {
                                  title: "MY POS API",
                                }
    end
  end
end
