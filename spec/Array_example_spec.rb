require 'spec_helper'
require 'rspec/its'

describe Array do

  its(:size) { is_expected.to be 0 }

  describe [1, 2, 3, 4] do
    its(:size) { is_expected.to be 4 }
  end

  describe '#[]' do
    context 'Element Reference ' do
      subject { [1, 2, 3] }
      its([0]) { is_expected.to be 1 }
    end
  end

end

describe Hash do

  its(:size) { is_expected.to be 0 }

  its(:keys) { is_expected.to be_empty }

end