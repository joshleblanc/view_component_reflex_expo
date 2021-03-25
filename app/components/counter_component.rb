class CounterComponent < ViewComponentReflex::Dom::Component
  self.reflex_base_class = ViewComponentReflex::Dom::Reflex

  def initialize
    @count = 0
  end

  def increment
    @count += 1
  end
end
