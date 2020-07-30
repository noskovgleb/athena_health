module AthenaHealth
  module Endpoints
    module States
      def all_states(practice_id:, params: {})
        response = @api.call(
            endpoint: "#{practice_id}/states",
            method: :get,
            params: params
        )

        StateCollection.new(response)
      end
    end
  end
end