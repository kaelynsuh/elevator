class Elevator
  attr_accessor :total_stops, :current_people

  def initialize
    @total_stops = 0
    @current_people = 0
  end

  def elevator_stops(a, b, max_elevator_weight, max_people_allowed)
    if a.empty?
      return @total_stops      
    else
      while (@current_people < max_people_allowed && a.any?)

        current_person_weight = a.shift
        current_person_floor = b.shift
        @current_people += 1
      end

      @total_stops += 1
      @current_people = 0

      # if current_person_weight > max_elevator_weight
      #   a.shift
      #   b.shift
      #   # dont incr
      # end

      elevator_stops(a, b, max_elevator_weight, max_people_allowed)
    end
  end
end

queue = Elevator.new
