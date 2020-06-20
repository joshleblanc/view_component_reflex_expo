class ExampleCodeComponent < ViewComponent::Base
  def initialize(example_code:, selected:)
    @example_code = example_code
    @selected = selected
  end

  def component_file_path
    "app/components/#{@example_code}_component.rb"
  end

  def erb_file_path
    "app/components/#{@example_code}_component.html.erb"
  end

  def component_code
    File.read(component_file_path).strip.html_safe
  end

  def erb_code
    File.read(erb_file_path).strip.html_safe
  end

  def render?
    @example_code == @selected
  end
end
