require 'spec_helper'
require 'rspec/its'

describe Array do

  its(:size) { is_expected.to be 0 }

  it 'when default Array new' do
    is_expected.to eq([])
  end

  describe [1, 2, 3, 4] do
    its(:size) { is_expected.to be 4 }
  end

  describe '#[]' do
    context 'Element Reference ' do
      subject { [1, 2, 3] }
      its([0]) { is_expected.to be 1 }
      its([1]) { is_expected.to be 2 }
    end
  end

  describe '#new' do

    context 'Over create new array' do
      subject { Array.new(4) { Hash.new } }
      it { is_expected.to match_array([{}, {}, {}, {}]) }
    end

  end

  describe '#combination' do
    subject { [1, 2, 3, 4] }
    it 'subject is instance type of Array over call method combination' do
      expect(subject.combination(2)).to include([1, 2])
    end

    it 'mock' do
      expect(subject).to receive(:combination).with(2)
      subject.combination(2)
    end

    it 'stub' do
      # allow(subject).to receive(:combination).with(2).and_return('fuck you')
      allow(subject).to receive(:combination).with(2).and_call_original
      # expect(subject.combination(2)).to eq([1,2])
      expect(subject.combination(2)).to include([1, 2])
    end
  end

end

describe Hash do

  its(:size) { is_expected.to be 0 }

  its(:keys) { is_expected.to be_empty }

end