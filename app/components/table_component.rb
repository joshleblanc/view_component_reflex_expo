# frozen_string_literal: true

class TableComponent < ViewComponentReflex::Component
  def initialize(collection:, columns:)
    @collection = collection
    @model_name = @collection.name.underscore

    @columns = columns

    @page_size = 10
    @page = 0
    @filter = {}
  end

  def permit_parameter?(initial_param, new_param)
    if new_param.is_a? Hash
      false
    else
      super
    end
  end

  def handle_filter_change
    if element.value.empty?
      @filter.delete element.dataset[:column]
    else
      @filter[element.dataset[:column]] = element.value
    end
  end

  def count
    filtered_rows.count
  end

  def handle_page_size_change
    @page_size = element.value.to_i
    @page = 0
  end

  def pages
    (filtered_rows.count / @page_size.to_f).ceil
  end

  def page_sizes
    options_for_select [10, 25, 50, 100], @page_size
  end

  def page_options
    pages.times.map do |num|
      [num.next, num]
    end
  end

  def omitted_from_state
    [:@columns]
  end

  def offset
    @page_size * @page
  end

  def set_page
    value = element.value.to_i
    @page = value - 1 unless value < 1 || value > pages
  end

  def next_page
    @page += 1 unless @page == pages - 1
  end

  def prev_page
    @page -= 1 unless @page.zero?
  end

  def filtered_rows
    filtered = @collection
    @filter.each do |k, v|
      filtered = filtered.where("lower(#{k}::text) LIKE ?", "#{v.downcase}%")
    end
    filtered
  end

  def page_rows
    filtered_rows.limit(@page_size).offset(offset)
  end

  def cell(model, column)
    if column[:accessor].is_a? Symbol
      model.send column[:accessor]
    else
      column[:accessor].call(model)
    end
  end
end
