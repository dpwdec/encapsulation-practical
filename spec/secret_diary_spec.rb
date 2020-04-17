require 'secret_diary'

describe SecretDiary do
  
  it { is_expected.to respond_to(:locked) }
  it { is_expected.to respond_to(:lock) }
  it { is_expected.to respond_to(:unlock) }
  
  it { is_expected.to respond_to(:entries) }
  
  it "is locked" do
    expect(subject.locked).to be true
  end
  
  describe "#lock" do
    context "it is locked" do
      it "raises an error 'already locked'" do
        expect { subject.lock }.to raise_error('already locked')
      end
      
      context "is is unlocked" do
        it "changes @locked to be true" do
          subject.unlock
          expect { subject.lock }.to change(subject, :locked).to be true
        end
      end
    end
  end
  
  describe "#unlock" do
    context "it is locked" do
      it "changes @locked to be false" do
        expect { subject.unlock }.to change(subject, :locked).to be false
      end
    end
    
    context "it is unlocked" do
      it "raises an error 'already unlocked'" do
        subject.unlock
        expect { subject.unlock }.to raise_error('already unlocked')
      end
    end
  end
end