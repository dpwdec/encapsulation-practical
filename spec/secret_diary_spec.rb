require 'secret_diary'

describe SecretDiary do

  it { is_expected.to respond_to(:add_entry).with(1).argument }
  it { is_expected.to respond_to(:get_entries) }

  describe "#add_entry" do
    context "it is locked" do
      it "raises an error 'diary is locked'" do
        expect { subject.add_entry("") }.to raise_error('diary is locked')
      end
    end

    context "it is unlocked" do
      it "adds an entry to diary" do
        subject.locker.unlock
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
        subject.locker.unlock
        expect(subject.get_entries).to be_a_kind_of(Array)
      end

      it "returns a list of diary entries" do
        subject.locker.unlock
        entry_1 = 'My first entry.'
        entry_2 = 'My day in the woods.'
        subject.add_entry(entry_1)
        subject.add_entry(entry_2)
        expect(subject.get_entries).to contain_exactly(entry_1, entry_2)
      end
    end
  end
end
