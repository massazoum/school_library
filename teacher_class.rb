require_relative 'person_class'

class Teacher < Person
  def initialize(specialization, name = 'Unknown', age = nil, parent_permission: true)
    super(name, age, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end