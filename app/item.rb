class Item
  attr_accessor :name, :price

  # @@all = []
  #
  # def self.all
  #   @@all
  # end

  def initialize(name,price)
    @name = name
    @price = price

    # self.class.all << self
  end
end
