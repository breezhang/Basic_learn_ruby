require 'spec_helper'

class Bar
  def piyo(param)
    # 未実装
  end
end

class Foo
  def hoge(param = 'abc')
    check(param)
    a = Bar.new.piyo(param)
    a.chop!
  end

  def check(param)
    param
  end
end

describe Foo do
  let(:target) { described_class.new }

  describe '#hoge' do

    subject { target.hoge('iii') }

    before do
      # 2
      bar = double('bar')
      allow(bar).to receive(:piyo).and_return("ABC\n")
      allow(Bar).to receive(:new).and_return(bar)
     # bar.allow(:piyo).and_return("ABC\n")
     # Bar.allow(:new).and_return(bar)
    end

    it 'mock' do
      #3
      #target.should_receive(:check).with('iii')
      expect(target).to receive(:check).with('iii')
      #should # => これを書かないと実行されないので書く必要がある
       target.check('iii')
    end

    it 'stub' do
      #4
      #should be == 'ABC'
      is_expected.to match /ABC/
    end

  end

end

class Car
  def honk
    puts 'Honk!!'
  end
end

describe Car do
  let(:car) { described_class.new }

  it 'receives honk' do
    # Stubs the message like before, but in addition also calls
    # the original implementation of `#honk`, thereby printing
    # "Honk!!". All this does is call the aliased method,
    # `#obfuscated_by_rspec_mocks__honk`!
    allow(car).to receive(:honk).and_call_original
    car.honk
  end
end