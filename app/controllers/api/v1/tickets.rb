module API
  module V1
    class Tickets < Grape::API
      include API::V1::Defaults

      before do
      end

      resource :tickets do
        params do
          requires :time, type: Integer
        end
        get :run_test do
          result = {}
          run_time = params[:time] || 30
          (0..run_time).step(10).each do |i|
            result["#{i}"] = 10
            sleep(10)
          end

          result
        end
      end

    end
  end
end
