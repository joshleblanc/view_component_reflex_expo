# frozen_string_literal: true

class AppComponent < ViewComponent::Base
  def components
    [
      { label: 'Index', to: '/' },
      { label: 'Local State', to: '/local_state' },
      { label: 'Loaders', to: '/loaders' },
      { label: 'Todos', to: '/todos' },
      { label: 'Data table', to: '/data_table' }
    ]
  end
end
