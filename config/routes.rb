Rails.application.routes.draw do
  mount API::Base => "/api/"
  mount GrapeSwaggerRails::Engine => "/api/swagger"
end
