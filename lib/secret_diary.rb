class SecretDiary

  attr_reader :locked, :entries

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

  def add_entry(entry)
    raise 'diary is locked' if @locked
    @entries << entry
  end

  def get_entries
    raise 'diary is locked' if @locked
    return @entries
  end
end
