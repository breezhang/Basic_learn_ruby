class Foo
  def method_missing(name, *args)
    if name.to_s =~ /(.*)=$/ && args[0].is_a?(Proc)
      self.class.instance_eval do
        define_method($1, args[0])
      end
    else
      super
    end
  end
end

f = Foo.new
f.greet = lambda {|t| "Hello #{t}!"}
#p f.greet "Lucas Carlson" # => Hello Lucas Carlson!

j = Foo.new
p j.greet "World" # => Hello World!