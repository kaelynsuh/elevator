require 'elevator'

RSpec.describe Elevator do
  let(:queue) { Elevator.new }

  describe '#initialize' do
    it 'initializes total_stops to 0' do
      expect(queue.total_stops).to eq(0)
    end

    it 'initializes current_people to 0' do
      expect(queue.current_people).to eq(0)
    end

    it 'initializes current_weight to 0' do
      expect(queue.current_weight).to eq(0)
    end
  end

  describe '#elevator_stops' do
    it 'if no one gets on, returns total_stops of 0' do
      queue.elevator_stops([], [], 200, 2)

      expect(queue.total_stops).to eq(0)
    end

    context 'one person gets on the elevator' do
      it 'returns total_stops of 1' do
        queue.elevator_stops([60], [2], 200, 2)

        expect(queue.total_stops).to eq(1)
      end

      it 'doesnt take the person if current_person_weight exceeds the max_elevator_weight' do
        queue.elevator_stops([250], [2], 200, 2)

        expect(queue.total_stops).to eq(0)
      end
    end

    context 'two people get on the elevator' do
      it 'if people_cap is 2, returns total_stops of 1' do
        queue.elevator_stops([60, 80], [2, 3], 200, 2)

        expect(queue.total_stops).to eq(1)        
      end

      it 'if 2 people exceed elevator_cap, they get put on separate elevators, with total_stops of 2' do
        queue.elevator_stops([180, 100], [2, 3], 200, 2)

        expect(queue.total_stops).to eq(2) 
      end
    end
  end
end