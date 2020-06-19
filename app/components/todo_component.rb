class TodoComponent < ViewComponentReflex::Component
  def initialize(todo:)
    @todo = todo
    @editing = false
  end

  def collection_key
    @todo.id
  end

  def begin_edit
    @editing = true
  end

  def commit_edit
    @todo.save
    end_edit
  end

  def handle_name_change
    @todo.name = element.value
  end

  def end_edit
    @todo.reload
    @editing = false
  end

  def toggle_completed
    @todo.completed = !@todo.completed
    @todo.save
    refresh! '.todo-info'
  end

  def todo_name(todo)
    classes = %w[is-size-5]
    classes.push 'completed' if todo.completed?
    tag.p(class: classes.join(' ')) do
      todo.name
    end
  end
end
