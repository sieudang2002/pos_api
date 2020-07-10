require "grape-swagger"

module API
  class Base < Grape::API
    prefix "/"
    mount API::V1::Base
  end
end
