require './nameable'

class Person < Nameable
  def initialize(age, name = 'Unknown', _parent_permission: true)
    super()
    @id = Random.rand(1..100)
    @name = name
    @age = age
  end

  # Getter for id
  attr_reader :id
  # Getters/setters for name and age
  attr_accessor :name
  attr_accessor :age

  def can_use_services?
    true if @age >= 18 || parent_permission == true
  end

  def correct_name
    @name
  end

  def of_age?
    @age >= 18
  end
end
