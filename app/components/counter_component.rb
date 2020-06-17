class CounterComponent < ViewComponentReflex::Component
  def initialize
    @count = 0
  end

  def test
    @count += 1
  end
end
