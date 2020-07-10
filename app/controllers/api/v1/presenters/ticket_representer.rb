module API
  module V1
    module Presenters
      module TicketRepresenter
        include Roar::JSON::HAL
        include Roar::Hypermedia
        include Grape::Roar::Representer
      end
    end
  end
end
