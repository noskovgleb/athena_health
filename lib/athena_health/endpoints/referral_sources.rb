module AthenaHealth
  module Endpoints
    module ReferralSources
      def all_referral_sources(practice_id:, params: {})
        response = @api.call(
          endpoint: "#{practice_id}/referralsources",
          method: :get,
          params: params
        )

        ReferralSourceCollection.new(response)
      end
    end
  end
end