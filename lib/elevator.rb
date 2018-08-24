class Elevator
  def elevator_stops(a, b, elevator_cap, people_cap)
    floors = Hash.new(0)
    stops = 0

    if a.empty?
      return 0
    elsif a[0] > elevator_cap
      a.shift
      b.shift
    else
      current_people = 0
      current_weight = 0
      while (current_people < people_cap &&
             !a.empty? && 
             current_weight + a[0] <= elevator_cap)
        current_people += 1
        current_weight += a.shift
        floors[b.shift] += 1
      end
      stops += 1
    end

    elevator_stops(a, b, elevator_cap, people_cap) + floors.count + stops
  end
end