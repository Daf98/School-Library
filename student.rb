require './person'
require './classroom'

class Student < Person
    # Create the belongs-to side (a student belongs to a classroom).
    attr_accessor :classroom
  def initialize(name = 'Unknown', age, classroom, parent_permission: false)
    super(name, age, classroom)
    @classroom = classroom
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
