require 'elevator'

RSpec.describe Elevator do
  let(:queue) { Elevator.new }

  describe '#initialize' do
    it 'initializes total_stops to 0' do
      expect(queue.total_stops).to eq(0)
    end
  end

