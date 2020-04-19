class Lock
  attr_reader :locked

  def initialize
    @locked = true
  end

  def lock
    raise 'already locked' if @locked
    @locked = true
  end

  def unlock
    raise 'already unlocked' if !@locked
    @locked = false
  end
end
