class SecretDiary

  attr_reader :locker

  def initialize
    @locked = true
    @entries = []
    @locker = Lock.new
  end

  def add_entry(entry)
    raise 'diary is locked' if locker.locked
    @entries << entry
  end

  def get_entries
    raise 'diary is locked' if locker.locked
    return @entries
  end
end
