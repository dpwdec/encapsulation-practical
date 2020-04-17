class SecretDiary
  
  attr_reader :locked
  attr_reader :entries
  
  def initialize
    @locked = true
    @entries = []
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