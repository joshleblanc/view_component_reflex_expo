# frozen_string_literal: true

class SelectComponent < ViewComponentReflex::Component
  def initialize(name:, options: [], selected:, data: {}, clearable: true, class_name: "")
    @name = name
    @options = options
    @selected = selected
    @data = data
    @clearable = clearable
    @class_name = class_name

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
