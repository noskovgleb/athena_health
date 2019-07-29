module AthenaHealth
  class PatientStatusCollection < BaseCollection
    attribute :patientstatuses, Array[PatientStatus]
  end
end
