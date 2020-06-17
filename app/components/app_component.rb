class AppComponent < ViewComponentReflex::Component
  def initialize
    @location = :index
  end

  def navigate
    @location = element.dataset[:to]
  end

  def component
    case @location
    when "local_state"
      LocalStateComponent.new
    else
      IndexPageComponent.new
    end
  end

  def components
    [
      { to: "local_state", label: "Local State" }
    ]
  end
end
