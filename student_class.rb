require_relative 'person_class'

class Student < Person
  # attr_accessor :classroom

  def initialize(classroom , name = 'Unknown', age = nil, parent_permission: true)
    super(name, age)
    @classroom = classroom
    # self.classroom.add_student(self)
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
