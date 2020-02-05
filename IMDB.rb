class Movie 
    def initialize(movie_name,character_list)
end

class Show
    attr_reader :show_name, :episode_list
    @@all = []
    def initialize(show_name)
        @show_name = show_name
        @episode_list = []
        @@all << self 
    end

    def self.all
        @@all 
    end

end

class Character
    attr_reader :charactor_name
    @@all = []
    def initialize(charactor_name)
        @charactor_name = charactor_name
        @@all << self 
    end

    def self.all
        @@all 
    end
end

class Actor 
    attr_reader :actor_name, :character_list
    @@all = []
    def initialize(actor_name)
        @actor_name = actor_name 
        @character_list = []
        @@all << self
    end

    def self.all
        @@all 
    end

    def add_character (character_list)
        character_list.each{|character| @character_list << character}
    end

    def self.most_characters
        all.max{|a,b| a.character_list.length <=> b.character_list.length}
    end
        
end
