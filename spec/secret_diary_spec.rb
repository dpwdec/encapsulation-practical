require 'secret_diary'

describe SecretDiary do
  
  it { is_expected.to respond_to(:locked) }
  it { is_expected.to respond_to(:lock) }
  it { is_expected.to respond_to(:unlock) }
  
  it { is_expected.to respond_to(:entries) }
  it { is_expected.to respond_to(:add_entry).with(1).argument }
  it { is_expected.to respond_to(:get_entries) }
  
  it "is locked" do
    expect(subject.locked).to be true
  end
  
  describe "#entries" do
    it "is a kind of Array" do
      expect(subject.entries).to be_a_kind_of(Array)
    end
    
    it "is empty" do
      expect(subject.entries).to be_empty
    end
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
  
  describe "#add_entry" do
    context "it is locked" do
      it "raises an error 'diary is locked'" do
        expect { subject.add_entry("") }.to raise_error('diary is locked')
      end
    end
  end
  
  describe "#get_entries" do
    context "it is locked" do
      it "raises error 'diary is locked'" do
        expect { subject.get_entries }.to raise_error('diary is locked')
      end
    end
    
    context "it is unlocked" do
      it "returns an array" do
        subject.unlock
        expect(subject.get_entries).to be_a_kind_of(Array)
      end
    end
  end
end