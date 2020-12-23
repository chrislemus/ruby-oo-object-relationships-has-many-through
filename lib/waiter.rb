require 'pry'
class Waiter
  @@all = []
  def initialize(name, years_of_experience)
    @name = name
    @years_of_experience = years_of_experience 
    @@all << self  
  end

  def new_meal(customer, total, tip)
    Meal.new(self, customer, total, tip)
  end

  def meals
    Meal.all.select {|meal| meal.waiter == self}
  end

  def best_tipper
    best_meal_tip = meals[0]
    meals.each {|meal| best_meal_tip = meal if meal.tip > best_meal_tip.tip}
    best_meal_tip.customer
  end

  def self.all
    @@all
  end
end

# class Customer
#   attr_reader :meals
#   @@all = []
#   def initialize(name, age)
#     @meals = []
#   end
#   def new_meal(waiter, total, tip)
#     @meals << Meal.new(waiter, self, total, tip)
#   end
#   def waiters
#     @meals.map {|meal| meal.waiter}
#   end
#   def self.all
#     @@all
#   end
# end