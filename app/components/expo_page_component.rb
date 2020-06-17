class ExpoPageComponent < ViewComponent::Base
  def initialize(title:, subtitle:, component:)
    @title = title
    @subtitle = subtitle
    @component = component
  end
end
