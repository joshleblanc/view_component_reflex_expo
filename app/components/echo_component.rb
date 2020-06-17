class EchoComponent < ViewComponent::Base
  def initialize(input:)
    @input = input
  end
end
