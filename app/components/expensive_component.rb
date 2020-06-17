class ExpensiveComponent < ViewComponentReflex::Component
  def initialize
    @loading = false
    @counter = 3
  end

  def execute
    @counter = 3
    @loading = true
    refresh!
    @counter.times do
      sleep 1
      @counter -= 1
      refresh!
    end
    @loading = false
  end
end
