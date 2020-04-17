class SecretDiary
  
  attr_reader :locked
  
  def initialize
    @locked = true
  end
  
  def lock
    raise 'already locked' if @locked
  end
  
  def unlock
  end
end