module AthenaHealth
  class StateCollection < BaseCollection
    attribute :states, Array[State]
  end
end
