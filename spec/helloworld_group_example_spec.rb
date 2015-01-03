class Sample

  def self.foobar

  end

  def foo

  end
end


shared_examples 'sample' do

  let(:foo) { described_class.new }

  describe '#foo' do

    it 'has methid foo' do
      expect(foo.respond_to?('foo')).to be true
    end

  end

  describe '.foobar' do

    it 'has class method foobar' do
      expect(Sample.respond_to?('foobar')).to be true
    end

  end

end

describe Sample do

  it_behaves_like "sample"

end

