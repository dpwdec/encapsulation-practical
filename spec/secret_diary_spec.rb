require 'secret_diary'

describe SecretDiary do
  
  it { is_expected.to respond_to(:locked) }
  it { is_expected.to respond_to(:lock) }
  
  it "is locked" do
    expect(subject.locked).to be true
  end
end