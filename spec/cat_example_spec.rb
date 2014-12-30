require 'spec_helper'
require 'rspec/its'

require_relative '../lib/cats'

describe Cats do
  let(:yellowcat) { described_class.new('yellow', 1) }

  before do
    allow(yellowcat).to receive(:show_action) { 'jump' }

  end

  describe 'has name attribute' do
    subject do
      Cats.new('yellow', 1)
    end

    #its(:name) { is_expected.to include('name')}
    its(:name) { is_expected.to match /yellow/ }

  end


  it '#show_action' do

    expect(yellowcat.show_action).to match /jump/
  end
end