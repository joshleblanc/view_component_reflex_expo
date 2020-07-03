class AppComponent < ViewComponent::Base
  def components
    {
      "index" => {
        label: "Index",
        to: "/"
      },
      "local_state" => {
        label: "Local State",
        to: "/local_state"
      },
      "loaders" => {
        label: "Loaders",
        to: "/loaders"
      },
      "todo" => {
        label: "Todos",
        to: "/todos"
      },
      "table_expo" => {
        label: "Data table",
        to: "/data_table"
      }
    }
  end
end
