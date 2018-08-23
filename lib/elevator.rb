class Elevator
  attr_accessor :total_stops

  def initialize
    @total_stops = 0
  end

  def elevator_stops(a, b)
    if a.empty?
      return @total_stops      
    else
      a.shift
      b.shift

      @total_stops += 1
      elevator_stops(a, b)
    end
  end
end
