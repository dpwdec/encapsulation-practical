# Secret Diary

## How to use

```
$irb
2.7.0 :001 > diary = SecretDiary.new
2.7.0 :002 > diary.locker.unlock
 => false
2.7.0 :003 > diary.add_entry('Dear diary')
 => ["Dear diary"]
2.7.0 :004 > diary.get_entries
 => ["Dear diary"]
2.7.0 :005 > diary.locker.lock
 => true
```

## Development
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

### Tests

diary --> @locked
  - [x] it responds to @locked
  - [x] @locked is true when diary is initialised

diary --> @entries
  - [x] it responds to @entries
  - [x] @entries is kind of array
  - [x] @entries is empty

lock --> [] --> locks diary
  - [x] it responds to #lock
  - [x] it errors if variable @locked is true
  - [x] it sets @locked to true if its false

unlock --> [] --> unlocks diary
  - [x] it responds to #unlock
  - [x] it errors if variable @locked is false
  - [x] it sets @locked to false if its true

add_entry --> [] --> adds an entry to list of diary entries
  - [x] it responds to #add_entry with 1 argument
  - [x] it errors if @locked is true
  - [x] it adds an entry to list of diary entries

get_entries --> [] -->
  - [x] it responds to #get_entries
  - [x] it errors if @locked is true
  - [x] returns a type of Array
  - [x] returns the list of diary entries in the Array
