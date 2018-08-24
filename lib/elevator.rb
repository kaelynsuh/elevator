class Elevator
  attr_accessor :total_stops, :current_people, :current_weight

  def initialize
    @total_stops = 0
    @current_people = 0
    @current_weight = 0
  end

  def elevator_stops(a, b, elevator_cap, people_cap)
    if a.empty?
      return @total_stops
    elsif a[0] > elevator_cap
      a.shift
      b.shift
    else
      while (@current_people <= people_cap && !a.empty? && @current_weight + a[0] <= elevator_cap)
        current_person_weight = a.shift
        current_person_floor = b.shift
        @current_people += 1
        @current_weight += current_person_weight
      end
      @current_people = 0
      @current_weight = 0
      @total_stops += 1
    end

    elevator_stops(a, b, elevator_cap, people_cap)
  end
end

queue = Elevator.new
