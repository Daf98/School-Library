require './person'
require './classroom'

class Student < Person
  # Create the belongs-to side (a student belongs to a classroom).
  attr_reader :classroom

  def initialize(age, name = 'Unknown', parent_permission: false)
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
end
