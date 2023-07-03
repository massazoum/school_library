require_relative 'person_class'

class Student < Person
  def initialize(classroom, name = 'Unknown', age = nil, parent_permission: true)
    super(name, age)
    @classroom = classroom
    @parent_permission = parent_permission
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
