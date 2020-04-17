# Secret Diary
```
SecretDiary
  - lock
  - unlock
  - add_entry
  - get_entries

Initially the `SecretDiary` class is locked, meaning `add_entry` and `get_entries` should throw an error.

When the user calls `unlock`, `add_entry` and `get_entries` should work as desired.

When the user calls `lock` again they throw errors again.
```

### Method Tests

lock --> [] --> locks diary
  it responds to #lock
  it errors if variable @locked is true
  it sets @locked to true if its false
unlock --> [] --> unlocks diary
  it responds to #unlock
  it errors if variable @locked is false
  it sets @locked to false if its true
add_entry --> [] --> adds an entry to list of diary entries
  it responds to #add_entry with 1 argument
  it errors if @locked is true
get_entries --> [] --> returns the list of diary 
  it responds to #get_entries
  it errors if @locked is true