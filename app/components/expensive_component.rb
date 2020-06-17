class ExpensiveComponent < ViewComponentReflex::Component
  def initialize
    @loading = false
  end

  def execute
    @loading = true
    refresh!
    sleep 3
    @loading = false
  end
end
