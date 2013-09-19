# The model has already been created by the framework, and extends Rhom::RhomObject
# You can add more methods here
class Todo
  include Rhom::PropertyBag

  # Uncomment the following line to enable sync with Todo.
  # enable :sync

  #add model specific code here

  def self.completed
    Todo.find(:all, :conditions=>{completed: true})
  end

  def self.incomplete
    Todo.find(:all, :conditions=>{completed: false})
  end
end
