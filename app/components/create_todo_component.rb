class CreateTodoComponent < ViewComponentReflex::Component
  def initialize
    @todo = new_todo
  end

  def permit_parameter?(initial_param, new_param)
    if initial_param.instance_of? Todo
      false
    else
      super
    end
  end

  def new_todo
    Todo.new(name: '', completed: false)
  end

  def add
    @todo.session_id = request.session.id.to_s
    @todo.save
    @todo = new_todo
    # Todo list is outside the scope of the component, but we still need to update it
    refresh! '.todo-list'
  end

  def handle_name_change
    @todo.name = element.value
  end
end
