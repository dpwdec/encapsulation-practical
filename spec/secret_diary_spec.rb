require 'secret_diary'

describe SecretDiary do

  it { is_expected.to respond_to(:locked) }
  it { is_expected.to respond_to(:lock) }
  it { is_expected.to respond_to(:unlock) }

  it { is_expected.to respond_to(:add_entry).with(1).argument }
  it { is_expected.to respond_to(:get_entries) }

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

  describe "#add_entry" do
    context "it is locked" do
      it "raises an error 'diary is locked'" do
        expect { subject.add_entry("") }.to raise_error('diary is locked')
      end
    end

    context "it is unlocked" do
      it "adds an entry to diary" do
        subject.unlock
        expect { subject.add_entry('Dear diary') }.to change(subject, :get_entries).to include('Dear diary')
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

      it "returns a list of diary entries" do
        subject.unlock
        entry_1 = 'My first entry.'
        entry_2 = 'My day in the woods.'
        subject.add_entry(entry_1)
        subject.add_entry(entry_2)
        expect(subject.get_entries).to contain_exactly(entry_1, entry_2)
      end
    end
  end
end
