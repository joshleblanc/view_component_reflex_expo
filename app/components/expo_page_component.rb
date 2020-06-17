class ExpoPageComponent < ViewComponent::Base
  with_content_areas :subtitle

  def initialize(title:, component:)
    @title = title
    @component = component
  end
end
