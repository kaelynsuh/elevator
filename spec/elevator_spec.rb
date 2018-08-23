require 'elevator'

RSpec.describe Elevator do
  let(:queue) { Elevator.new }

  describe '#initialize' do
    it 'initializes total_stops to 0' do
      expect(queue.total_stops).to eq(0)
    end
  end

  describe '#elevator_stops' do
    it 'if no one gets on, returns total_stops of 0' do
      queue.elevator_stops([], [])

      expect(queue.total_stops).to eq(0)
    end

    context 'one person gets on the elevator' do
      it 'returns total_stops of 1' do
        queue.elevator_stops([60], [2])

        expect(queue.total_stops).to eq(1)
      end

    end
  end
end