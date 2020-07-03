# frozen_string_literal: true

class SelectComponent < ViewComponentReflex::Component
  def initialize(name:, options: [], selected:, data: {}, clearable: true)
    @name = name
    @options = options
    @selected = selected
    @data = data
    @clearable = clearable

    initialize_data

  end

  private

  def initialize_data
    data = {
      target: 'select.select'
    }
    @data.merge! data
  end
end
