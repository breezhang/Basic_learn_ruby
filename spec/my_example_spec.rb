require 'spec_helper'
require 'rspec/its'

require_relative '../lib/Helloworld'


describe Helloworld do
  describe '#new' do
    it { is_expected.to be_an_instance_of(Helloworld) }
  end

  context 'title has a value' do
    its(:title) { is_expected.to eq(1) }
  end

  describe '#say' do
    it 'some example' do
      expect(described_class).to eq(Helloworld)
    end

  end

end





