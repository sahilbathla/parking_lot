require_relative '../../lib/slots'

describe Slot do
  describe 'initialize' do
    context 'given input paramaters is correct' do
      it 'returns new slot instance' do
        slot = Slot.new('1')
        expect(slot.class).to eql(Slot)
        expect(slot.id).to eql(1)
        slot = Slot.new(2)
        expect(slot.id).to eql(2)
      end
    end

    context 'given input paramaters have partial or no parameters' do
      it 'throws exception due to missing argument errors' do
        expect { Slot.new }.to raise_error(ArgumentError)
      end
    end
  end

  describe 'park' do
    context 'given vehicle paramaters are correct' do
      it 'sets vehicle as alloted new vehicle' do
        slot = Slot.new('1')
        slot.park('vehicle_number', 'vehicle_color')
        expect(slot.vehicle.class).to eql(Vehicle)
        expect(slot.vehicle.vehicle_number).to eql('vehicle_number')
        expect(slot.vehicle.vehicle_color).to eql('vehicle_color')
      end

      it 'throws error if a vehicle is parked where slot is filled' do
        slot = Slot.new('1')
        slot.park('vehicle_number', 'vehicle_color')
        expect { slot.park('vehicle_number1', 'vehicle_color1') }.to raise_error(VehicleAlreadyParked)

      end
    end

    context 'given vehicle paramaters are missing' do
      it 'throws exception due to missing argument errors' do
        slot = Slot.new('1')
        expect { slot.park('x') }.to raise_error(ArgumentError)
      end
    end
  end

  describe 'free' do
    it 'sets vehicle as nil' do
      slot = Slot.new('1')
      slot.free
      expect(slot.vehicle).to eql(nil)
    end
  end

  describe 'free?' do
    context 'no vehicle alloted' do
      it 'returns true' do
        slot = Slot.new('1')
        expect(slot.free?).to eql(true)
      end
    end

    context 'vehicle alloted' do
      it 'returns false' do
        slot = Slot.new('1')
        slot.park('xyz', 'White')
        expect(slot.free?).to eql(false)
      end
    end
  end

  describe 'vehicle_number' do
    it 'gives nil if no vehicle alloted' do
      slot = Slot.new('1')
      expect(slot.vehicle_number).to eql(nil)
    end

    it 'gives vehicle number if vehicle alloted' do
      slot = Slot.new('1')
      slot.park('xyz', 'White')
      expect(slot.vehicle_number).to eql('xyz')
    end
  end

  describe 'vehicle_color' do
    it 'gives nil if no vehicle alloted' do
      slot = Slot.new('1')
      expect(slot.vehicle_color).to eql(nil)
    end

    it 'gives vehicle number if vehicle alloted' do
      slot = Slot.new('1')
      slot.park('xyz', 'White')
      expect(slot.vehicle_color).to eql('White')
    end
  end
end