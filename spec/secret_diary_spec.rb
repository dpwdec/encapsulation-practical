require 'secret_diary'

describe SecretDiary do
  
  it { is_expected.to respond_to(:lock) }
end