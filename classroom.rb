class Classroom
  def initialize(label)
    @label = label
    @students = []
  end
  attr_accessor :label
  attr_reader :students

  #   Create the has-many side (a classroom has many students).
  def add_student(student)
    @students.push(student)
    #   Make sure that when setting the classroom for a student it also adds it to the classrooms' students.
    student.classroom = self
  end
end
