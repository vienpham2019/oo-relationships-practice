require "pry"

class Client 
    attr_reader :client_name, :age
    attr_accessor :trainers
    @@all = []
    def initialize(client_name,age)
        @client_name = client_name
        @age = age 
        @@all << self 
    end

    def self.all
        @@all
    end
end

class Trainer
    attr_reader :trainer_name, :age, :exp, :clients
    @@all = []
    def initialize(trainer_name, age, exp)
        @trainer_name = trainer_name 
        @age = age 
        @exp = exp
        @clients = []
        @@all << self
    end

    def self.all
        @@all 
    end

    def add_clinet (clientArr)
        clientArr.each{|clinet| @clients << clinet}
    end 

    def self.most_clients
        trainer = all.max{|a,b| a.clients.length <=> b.clients.length}
        "#{trainer.trainer_name} have #{trainer.clients.length} clients."
    end
end

class Location
    attr_reader :gym_name,:trainers
    @@all = []
    def initialize(gym_name)
        @gym_name = gym_name
        @trainers = []
        @@all << self
    end

    def self.all
        @@all
    end

    def add_trainer (trainerArr)
        trainerArr.each{|trainer| @trainers << trainer}
    end

    def clients
        @trainers.map{|trainer| trainer.clients}.flatten.uniq.length
    end

    def self.least_clients 
        gym = all.min{|a,b| a.clients <=> b.clients}
        "#{gym.gym_name} have #{gym.clients} clients."
    end
end

c1 = Client.new("a1",20)
c2 = Client.new("a2",21)
c3 = Client.new("a3",22)
c4 = Client.new("a4",23)
c5 = Client.new("a5",24)
c6 = Client.new("a6",27)
c7 = Client.new("a7",30)
c8 = Client.new("a8",38)
c9 = Client.new("a9",49)
c10 = Client.new("a10",50)

t1 = Trainer.new("t1",20,"20 years")
t1.add_clinet([c1,c2,c4,c9,c8,c10])

t2 = Trainer.new("t2",23,"2 years")
t2.add_clinet([c3,c4,c5,c8,c6])

t3 = Trainer.new("t3",27,"30 years")
t3.add_clinet([c7,c2,c1,c8])

t4 = Trainer.new("t4",30,"12 years")
t4.add_clinet([c2,c9])

t5 = Trainer.new("t5",35,"5 years")
t5.add_clinet([c4,c6,c10])

gold_gym = Location.new("gold gym")
gold_gym.add_trainer([t1,t2,t3])

ymca = Location.new("YMCA")
ymca.add_trainer([t4,t5])

planet_fitness = Location.new("planet fitness")
planet_fitness.add_trainer([t2,t4])





binding.pry
0
