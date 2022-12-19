class Item
    @@items = []

    attr_accessor :id, :name, :price, :availability, :feedbacks

    def initialize(id = 0, name ="", price = 0, availability = 0, feedbacks = "")
        @id = id
        @name = name
        @price = price
        @availability = availability
        @feedbacks = feedbacks
    end

    def self.set_item(item)
        @@items.push(item)
    end

    def self.get_All()
        @@items
    end

    def to_s()
        [@id, @name, @price, @feedbacks, @availability]
    end

    def to_h()
        {
            "id" => @id, 
            "name"=> @name, 
            "price" => @price, 
            "availability" => @availability, 
            "feedbacks" => @feedbacks
        }
    end

    def info()
        yield
    end
end
