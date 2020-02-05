require "pry"
class Passenger 
    attr_reader :passenger_name
    def initialize(passenger_name)
        @passenger_name = passenger_name
    end

    def trips 
        Ride.all.select{|trip| trip.passenger == self}
    end

    def rides
        trips
    end

    def drivers
        trips.map{|trip| trip.driver.driver_name}.uniq
    end

    def total_distance
        total = 0
        trips.each{|ride| total += ride.distance}
        total
    end

    def self.premium_members
        hash = Hash.new{|h,k| h[k] = 0}
        Ride.all.each{|trip| hash[trip.passenger] += trip.distance}
        hash.to_a.select{|passenger| passenger[1] > 100}.to_h
    end
end

class Driver 
    attr_reader :driver_name, :passenger_name
    def initialize(driver_name,passenger_name)
        @driver_name = driver_name
        @passenger_name = passenger_name
    end

    def trips 
        Ride.all.select{|trip| trip.driver == self}
    end

    def rides
        trips
    end

    def passengers
        trips.map{|trip| trip.passenger.passenger_name}.uniq
    end

    def self.mileage_cap(distance)
        hash = Hash.new{|h,k| h[k] = 0}
        Ride.all.each do |trips| 
            hash[trips.driver] += trips.distance
        end
        hash.to_a.select{|e| e[1] >= distance}.map{|e| e[0].driver_name}
    end
end

class Ride 
    attr_reader :location, :distance, :passenger, :driver
    @@all = []
    def initialize(location,distance,passenger,driver)
        @location = location
        @distance = distance
        @passenger = passenger
        @driver = driver
        @@all << self
    end

    def self.all
        @@all 
    end 

    def self.average_distance
        total_distance = 0
        @@all.each{|trip| total_distance += trip.distance}
        total_distance / @@all.length.to_f
    end
end

 vien = Driver.new("vien","viet")
 jonh = Driver.new("john","viet")
 pat = Driver.new("pat","viet")

 viet = Passenger.new("viet")
 duy = Passenger.new("duy")

 new_york = Ride.new("New York",100,viet,vien)
 texas = Ride.new("Texas",200,viet,jonh)
 washington = Ride.new("Washington",300,viet,pat)
 california = Ride.new("California",200,viet,vien)
 california = Ride.new("California",200,viet,vien)

 new_york = Ride.new("New York",10,duy,vien)
 texas = Ride.new("Texas",20,duy,jonh)
 washington = Ride.new("Washington",30,duy,pat)
 california = Ride.new("California",20,duy,vien)
 california = Ride.new("California",20,duy,vien)

 binding.pry
 0


