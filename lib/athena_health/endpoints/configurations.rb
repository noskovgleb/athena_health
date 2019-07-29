module AthenaHealth
  module Endpoints
    module Configurations
      def all_facilities(practice_id:, department_id:, order_type:, params: {})
        response = @api.call(
          endpoint: "#{practice_id}/chart/configuration/facilities",
          method: :get,
          params: params.merge!(departmentid: department_id, ordertype: order_type)
        )

        response.map {|facility| AthenaHealth::Facility.new(facility) }
      end

      def all_medications(practice_id:, search_value:)
        response = @api.call(
          endpoint: "#{practice_id}/reference/medications",
          method: :get,
          params: { searchvalue: search_value }
        )

        response.map {|medication| AthenaHealth::Medication.new(medication) }
      end

      def all_allergies(practice_id:, search_value:)
        response = @api.call(
          endpoint: "#{practice_id}/reference/allergies",
          method: :get,
          params: { searchvalue: search_value }
        )

        response.map {|allergy| AthenaHealth::Allergy.new(allergy) }
      end

      def all_insurances(practice_id:, plan_name:, member_id:, state:, params: {})
        response = @api.call(
          endpoint: "#{practice_id}/insurancepackages",
          method: :get,
          params: params.merge!(
            insuranceplanname: plan_name,
            memberid: member_id,
            stateofcoverage: state
          )
        )

        AthenaHealth::InsuranceCollection.new(response)
      end

      def all_order_types(practice_id:, search_value:)
        response = @api.call(
          endpoint: "#{practice_id}/reference/order/lab",
          method: :get,
          params: { searchvalue: search_value }
        )

        response.map { |ordertype| AthenaHealth::OrderType.new(ordertype) }
      end

      def patient_locations(practice_id:, department_id:)
        response = @api.call(
            endpoint: "#{practice_id}/chart/configuration/patientlocations",
            method: :get,
            params: { departmentid: department_id }
        )

        response.map {|location| AthenaHealth::Location.new(location) }
      end
    end
  end
end
