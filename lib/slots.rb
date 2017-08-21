require_relative './vehicle'

class Slot
	attr_accessor :id, :vehicle

	def initialize (id)
		@id = id
	end

	def park(vehicle_number, vehicle_color)
		self.vehicle = ::Vehicle.new(vehicle_number, vehicle_color)
	end

	def free
		self.vehicle = nil
	end

	def free?
		self.vehicle == nil
	end

	def vehicle_number
		vehicle.vehicle_number if vehicle
	end

	def vehicle_color
		vehicle.vehicle_color if vehicle
	end
end