require './person'
require './classroom'

class Student < Person
  # Create the belongs-to side (a student belongs to a classroom).
  attr_reader :classroom

  # rubocop:disable Style/OptionalBooleanParameter
  def initialize(age, name = 'Unknown', parent_permission = false)
    # rubocop:enable Style/OptionalBooleanParameter
    super(age, name, parent_permission:)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  # Make sure that when adding a student to a classroom it also sets the classroom for the student.

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  # Serialize Foo object with its class name and arguments
  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'a' => [age, name, @parent_permission]
    }.to_json(*args)
  end

  # Deserialize JSON string by constructing new Foo object with arguments.
  def self.json_create(object)
    new(*object['a'])
  end
end
