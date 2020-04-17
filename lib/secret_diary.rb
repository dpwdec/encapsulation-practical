class SecretDiary
  
  attr_reader :locked
  
  def initialize
    @locked = true
  end
  
  def lock
    raise 'already locked' if @locked
    @locked = true
  end
  
  def unlock
    @locked = false
  end
end