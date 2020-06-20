# frozen_string_literal: true

class ExampleCodeComponent < ViewComponentReflex::Component
  def initialize(example_code:, selected:)
    @example_code = example_code
    @selected = selected
    @tab = tabs[0]
  end

  def tabs
    tabs = %w[Component Template]
    tabs << 'Stimulus Controller' if stimulus_controller?
    tabs
  end

  def select_tab
    @tab = element.dataset[:tab]
  end

  def component_file_path
    "app/components/#{@example_code}_component.rb"
  end

  def erb_file_path
    "app/components/#{@example_code}_component.html.erb"
  end

  def stimulus_controller_file_path
    "app/javascript/controllers/#{@example_code}_controller.js"
  end

  def stimulus_controller?
    File.exist?(stimulus_controller_file_path)
  end

  def component_code
    File.read(component_file_path).strip.html_safe
  end

  def erb_code
    File.read(erb_file_path).strip.html_safe
  end

  def stimulus_controller_code
    File.read(stimulus_controller_file_path).strip.html_safe
  end

  def render?
    @example_code == @selected
  end
end
