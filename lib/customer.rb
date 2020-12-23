class Customer
  attr_reader :meals
  @@all = []
  def initialize(name, age)
    @name = name
    @age = age
    @@all << self
    @meals = []
  end

  def new_meal(waiter, total, tip)
    @meals << Meal.new(waiter, self, total, tip)
  end

  def waiters
    @meals.map {|meal| meal.waiter}
  end

  def self.all
    @@all
  end
end