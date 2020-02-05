# create files for your ruby classes in this directory
# require "pry"
class Listing
    attr_reader :guest, :trip
    @@all = []
    @@most_popular = Hash.new{|h,k| h[k] = 0}
    def initialize(guest, trip)
        @guest = guest
        @trip = trip
        @@all << self 
    end

    def self.all
        @@all 
    end

    def trip_count
        @@all.length
    end

    def self.find_all_by_city(city)
        Trip.all.select{|city| city.trip.trip_city = city}
    end

    def self.most_popular
        @@all.each do |e| 
            @@most_popular[e.trip.trip_city] += 1
        end
        @@most_popular.to_a.max{|a,b| a[1] <=> b[1]}[0]
    end
        
end

class Guest
    attr_reader :name 
    @@all = []
    @@guest_trips = Hash.new{|h,k| h[k] = 0}
    def initialize(name)
        @name = name 
        @@all << self
    end

    def self.all
        @@all 
    end

    def trips
        Listing.all.select{|trip| trip.guest == self}
    end
    
    def trip_count
        trips.length
    end

    def self.pro_traveller
        Listing.all.each do |trip| 
            @@guest_trips[trip.guest] += 1
        end
        @@guest_trips.to_a.select{|trip| trip[1] > 1}
    end

    def self.find_all_by_name(name)
        Listing.all.select{|trip| trip.guest.name == name}
    end

end

class Trip
    attr_reader :trip_city
    @@all = []
    def initialize(trip_city)
        @trip_city = trip_city 
        @@all << self
    end

    def self.all
        @@all
    end

    def listing
        Listing.all.select{|e| e.trip == self}
    end

    def guest
        Listing.all.select{|e| e.guest == self}
    end

end

vien = Guest.new("vien")
viet = Guest.new("viet")
viets = Guest.new("viets")


new_york = Trip.new("new york")
chicago = Trip.new("chicago")
los_angeles = Trip.new("lost angeles")
san_fransisco = Trip.new("san fransisco")

l1 = Listing.new(vien,new_york)
l2 = Listing.new(vien,chicago)
l3 = Listing.new(vien,los_angeles)
l4 = Listing.new(viet,chicago)
l5 = Listing.new(viet,san_fransisco)
l6 = Listing.new(viets,san_fransisco)
l7 = Listing.new(vien,san_fransisco)



# binding.pry
# 0



