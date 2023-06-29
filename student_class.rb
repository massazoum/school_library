require_relative 'person_class'

class Student < Person
  def initialize(classroom, name = 'Unknown', age = nil, parent_permission: true)
    super(name, age, parent_permission)
    # @classroom = classroom
    self.classroom = classroom
    classroom.add_student(self)
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
