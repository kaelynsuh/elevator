class Elevator
  attr_accessor :total_stops, :current_people, :current_weight, :floors

  def initialize
    @total_stops = 0
    @current_people = 0
    @current_weight = 0
    @floors = Hash.new(0)
  end

  def elevator_stops(a, b, elevator_cap, people_cap)
    if a.empty?
      return @total_stops
    elsif a[0] > elevator_cap
      a.shift
      b.shift
    else
      while (@current_people < people_cap && !a.empty? && @current_weight + a[0] <= elevator_cap)
        @current_people += 1
        @current_weight += a.shift
        @floors[b.shift] += 1
      end

      reset()
    end

    elevator_stops(a, b, elevator_cap, people_cap)
  end

  def reset()
    @current_people = 0
    @current_weight = 0
    @total_stops += @floors.count + 1
    @floors = Hash.new(0)
  end
end

# queue = Elevator.new
# puts queue.elevator_stops([60, 80, 40], [2, 3, 5], 200, 2)