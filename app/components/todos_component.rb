# frozen_string_literal: true

class TodosComponent < ViewComponentReflex::Component
  def initialize
    @filter = 'All'
  end

  def filtered_todos
    case @filter
    when 'Active'
      active_todos
    when 'Completed'
      completed_todos
    else
      todos
    end
  end

  def completed_todos
    todos.where(completed: true)
  end

  def active_todos
    todos.where(completed: false)
  end

  def todos
    Todo.where(session_id: request.session.id.to_s).order(:created_at)
  end

  def filter_class(filter)
    if @filter == filter
      'is-primary'
    else
      'is-light'
    end
  end

  def tags
    buttons = %w[All Active Completed]
    tag.div class: 'tags has-addons' do
      buttons.each do |button|
        opts = {
          class: "tag #{filter_class(button)}",
          data: {
            reflex: 'click->TodosComponentReflex#filter', filter: button, key: key
          }
        }
        concat tag.a(button, opts)
      end
    end
  end

  def no_todos_text
    case @filter
    when 'Completed'
      "You haven't completed any of your todos!"
    when 'Active'
      "You've completed all your todos!"
    else
      "You haven't created any todos!"
    end
  end

  # reflexes

  def filter
    @filter = element.dataset[:filter]
  end

  def clear
    completed_todos.destroy_all
  end
end
