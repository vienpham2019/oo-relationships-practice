require "pry"
class Bakery
    attr_reader :desserts , :bakery_name
    @@all = []
    def initialize(desserts,bakery_name)
        @desserts = desserts
        @bakery_name = bakery_name
        @@all << self
    end

    def self.all
        @@all 
    end 

    def ingredients 
        desserts.map{|e| e.ingredients}.flatten.uniq
    end

    def average_calories
        average_calories = 0
        desserts.each do |dessert| 
           average_calories += dessert.calories
        end
        average_calories / self.desserts.length.to_f
    end

    def shopping_list
        ingredients.map{|e| e.ingredient}.sort()
    end

end

class Desserts
    attr_reader :ingredients, :name 
    @@all = []
    def initialize(ingredients,name)
        @ingredients = ingredients
        @name = name 
        @@all << self
    end

    def self.all 
        @@all
    end

    def bakery
        Bakery.all.select{|e| e.desserts.include?(self)}
    end

    def calories
        total_calories = 0
        ingredients.each do |e| 
            total_calories += e.calories
        end
        total_calories
    end

end

class Ingredients
    attr_reader :ingredient, :calories
    @@all = []
    def initialize(ingredient,calories)
        @ingredient = ingredient
        @calories = calories
        @@all << self
    end

    def self.all
        @@all 
    end

    def self.find_all_by_name(ingredient)
        @@all.select{|ing| ing.ingredient.match(ingredient)}
    end
end

dulce_de_ieche = Ingredients.new("dulce de ieche", 20)
sugar = Ingredients.new("sugar",10)
butter = Ingredients.new("butter",12)
egg = Ingredients.new("egg",5)
flour = Ingredients.new("flour",9)
pistachios = Ingredients.new("pistachios",12)
ghee = Ingredients.new("ghee",13)
chocalate = Ingredients.new("chocalate",21)
cocoa_solids = Ingredients.new("cocoa solids",15)
chocalate_chip = Ingredients.new("chocalate chips",30)
vanilla = Ingredients.new("vanilla",20)
baking_powder = Ingredients.new("baking powder",21)
ricotta = Ingredients.new("ricotta",19)
cream = Ingredients.new("cream",23)
cheese = Ingredients.new("cheese",25)
milk = Ingredients.new("milk",40)
ground_cinnamon = Ingredients.new("ground cinnamon",25)

alfajores = Desserts.new([dulce_de_ieche,sugar,butter,egg,flour],"alfajores")
borma = Desserts.new([pistachios,ghee,flour,sugar],"borma")
brownies = Desserts.new([chocalate,butter,egg,flour,cocoa_solids,sugar,chocalate_chip,vanilla,baking_powder],"brownies")
cannoli = Desserts.new([ricotta,cream,chocalate,cheese,pistachios,egg,chocalate_chip,sugar,vanilla,milk,butter,flour,ground_cinnamon],"cannoli")

vp_bakery = Bakery.new([alfajores,borma,brownies],"vp bakery")
vp2_bakery = Bakery.new([borma,brownies,cannoli],"vp2 bakery")

binding.pry
0