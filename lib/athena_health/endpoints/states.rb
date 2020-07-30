module AthenaHealth
  module Endpoints
    module States
      def all_states(practice_id:)
        response = @api.call(
            endpoint: "#{practice_id}/states",
            method: :get
        )

        response.map {|state| AthenaHealth::State.new(state) }
      end
    end
  end
end