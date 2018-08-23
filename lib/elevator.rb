class Elevator
  attr_accessor :total_stops

  def initialize
    @total_stops = 0
  end

  def elevator_stops(a, b, max_elevator_weight)
    if a.empty?
      return @total_stops      
    else
      current_person_weight = a.shift
      current_person_floor = b.shift

      if current_person_weight > max_elevator_weight
        # dont incr
      else
        @total_stops += 1
      end

    end
    elevator_stops(a, b, max_elevator_weight)
  end
end

