require './nameable'
require './rental'

class Person < Nameable
  # Getter for id
  attr_reader :id, :rentals
  # Getters/setters for name and age
  attr_accessor :name
  attr_accessor :age

  def initialize(name = 'Unknown', age, parent_permission)
    super()
    @id = Random.rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    true if @age >= 18 || parent_permission == true
  end

  def correct_name
    @name
  end

  def of_age?
    @age >= 18
  end

  # Create the has-many side of Person and Rental (a person has many rentals).
  def add_rentals(rental)
    @rentals.push(rental)
    rental.person = self
  end
end
