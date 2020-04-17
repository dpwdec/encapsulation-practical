require 'secret_diary'

describe SecretDiary do
  
  it { is_expected.to respond_to(:locked) }
  it { is_expected.to respond_to(:lock) }
  it { is_expected.to respond_to(:unlock) }
  
  it "is locked" do
    expect(subject.locked).to be true
  end
  
  describe "#lock" do
    context "it is locked" do
      it "raises an error 'already locked'" do
        expect { subject.lock }.to raise_error('already locked')
      end
    end
  end
end