require_relative 'person_class'

class Teacher < Person
  def initialize(specialization, name = 'Unknown', age = nil, parent_permission: true)
    super(name, age)
    @specialization = specialization
    @parent_permission = parent_permission
  end

  def can_use_services?
    true
  end
end
