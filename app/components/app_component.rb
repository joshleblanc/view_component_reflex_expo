class AppComponent < ViewComponentReflex::Component
  def initialize
    @location = "index"
  end

  def navigate
    @location = element.dataset[:to]
  end

  def component
    components[@location][:component].new
  end

  def components
    {
      "index" => {
        label: "Index",
        component: IndexPageComponent
      },
      "local_state" => {
        label: "Local State",
        component: LocalStateComponent
      },
      "loaders" => {
        label: "Loaders",
        component: LoaderComponent
      },
      "todo" => {
        label: "Todos",
        component: TodoPageComponent
      }
    }
  end
end
