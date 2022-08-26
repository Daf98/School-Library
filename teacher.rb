require './person'

class Teacher < Person
  def initialize(name = 'Unknown', age, specialization, parent_permission: false)
    super(name, age, specialization)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
