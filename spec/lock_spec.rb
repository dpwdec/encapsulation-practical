require 'lock'

describe Lock do
  it { is_expected.to respond_to(:locked) }
  it { is_expected.to respond_to(:lock) }
  it { is_expected.to respond_to(:unlock) }

  it "is locked" do
    expect(subject.locked).to be true
  end
end
