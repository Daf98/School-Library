class Person
  def initialize(name = 'Unknown', age, parent_permission: true)
    @id = id
    @name = name
    @age = age
  end

  # Getter for id
  def id
    @id
  end
  # Getters/setters for name and age
  attr_accessor :name
  attr_accessor :age

  def is_of_age?
    if @age >= 18
      true
    else
      false
    end
  end

  private

  def can_use_services?
    true if @age >= 18 || parent_permission == true
  end
end
