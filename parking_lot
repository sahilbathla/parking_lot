#!/usr/bin/env ruby
require_relative './lib/parking_lot'
require 'rspec'

def process_input(input)
  latest_parking_lot = nil
  input.split("\n").each do |input|
    sliced_input = input.split(/\s/)
    command = sliced_input[0]
    if  command == 'create_parking_lot'
      no_of_slots = sliced_input[1]
      latest_parking_lot = ParkingLot.new(no_of_slots)
    else
      #The following line will just execute the command passed by passing the parameters
      # as arguments
      # i.e. latest_parking_lot.park(vehicle_no, vehicle_color)
      latest_parking_lot.send(command, *([sliced_input[1], sliced_input[2]].compact))
    end
  end
end

def main
  RSpec::Core::Runner.run([File.dirname(__FILE__) + '/specs'])
  if (ARGV.length == 0)
    puts "Please enter file parameter"
    return
  else
    begin
      input = File.read(ARGV[0])
    rescue StandardError => bang
      puts "Error reading file #{ bang }"
      return
    end
  end
  begin
    process_input(input)
  rescue StandardError => bang
  puts "Error processing input. Error - #{ bang }"
  end
end

main()