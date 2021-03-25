class TodoComponent < ViewComponentReflex::Component
  def initialize(todo:, parent_key:)
    @todo = todo
    @editing = false
    @parent_key = parent_key
  end

  def permit_parameter?(initial_param, new_param)
    if new_param.instance_of? Todo
      true
    else
      super
    end
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

  def delete
    @todo.destroy
    refresh! '.todo-list'
  end

  def handle_name_change
    @todo.name = element.value
  end

  def end_edit
    @todo.reload
    @editing = false
  end

  def toggle_completed
    prevent_refresh!

    @todo.completed = !@todo.completed
    @todo.save
    # refresh! '.todo-list'
    #
    stimulate("TodosComponent#do_nothing", { key: @parent_key })
  end

  def todo_name(todo)
    classes = %w[is-size-5]
    classes.push 'completed' if todo.completed?
    tag.p(class: classes.join(' ')) do
      todo.name
    end
  end
end
