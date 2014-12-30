p "first ?"

# $LOAD_PATH.unshift(File.expand_path('../lib', __FILE__))
#
# p $:

#$LOAD_PATH.unshift(File.expand_path('../lib/',__FILE__))

#p $LOAD_PATH

#require '../lib/Helloworld'

#require   File.expand_path('../lib/Helloworld', __FILE__)

require File.join(File.dirname(__FILE__), 'lib', 'justshowonemessage')
require File.join(File.dirname(__FILE__), 'lib', 'coffee')
require File.join(File.dirname(__FILE__), 'lib', 'lookup')


# #Foo.new.message
#
# foo = Foo.new
#
# foo.instance_eval  <<EOT
#   def foos
#     "Hello World!"
#   end
# EOT
#
# p Foo.singleton_methods
# p foo.singleton_methods
#
# Bar.new
#
# require 'singleton'
#
# class Example
#   include Singleton
#   attr_accessor :keep, :strip
#   def _dump(depth)
#     # this strips the @strip information from the instance
#     Marshal.dump(@keep, depth)
#   end
#
#   def self._load(str)
#     instance.keep = Marshal.load(str)
#     instance
#   end
# end
#
# a = Example.instance
# a.keep = "keep this"
# a.strip = "get rid of this"
# a.taint
#
# #stored_state =
#     p Marshal.dump(a)
#
# # a.keep = nil
# # a.strip = nil
# # b = Marshal.load(stored_state)
# # p a == b  #  => true
# # p a.keep  #  => "keep this"
# # p a.strip #  => nil
#
# p Foobar.new.hello


class Test
  def hello
    puts "hello--------------------------"
  end

  profile :hello
end

#puts (Time.now - start_time).to_s + " have elapsed "
#Test.new.rprof_hello
Test.new.hello

# noinspection RubyUnusedLocalVariable
class Demo
  def show_time(*args)
    Time.now
  end
end

class Decorator

  def show_time
    "1111111111111"
  end
  def initialize(subject)

    if (subject)

    subject.public_methods(false).each do |meth|
      (
      class <<self;
        self;
      end).class_eval do |*args, &block|
        define_method meth do
          subject.send meth, args, block
        end
      end
    end
    else

    end


  end

end

p Decorator.new(Demo.new).show_time


onecupcoffee = Coffee.new

onecupcoffee.extend(Sugar,Milk)

p onecupcoffee.class.ancestors


# object = B.new
# object.extend(Y)
# object.extend(Z)
#
# def object.foo
#   "- Method defined directly on an instance of B\n" + super
# end
#
# puts object.foo

class C <A
  include W
  include X
  def foo
    super + 'done'
  end
end

p C.new.class.ancestors

puts C.new.foo


puts Class.ancestors



class Parent
  def identify
    puts "Parent"
  end
end

class Child < Parent
  def identify
    puts "Child"
    super
  end
end

module FirstMixin
  def identify
    puts "FirstMixin"
    super
  end
end

module SecondMixin
  def identify
    puts "SecondMixin"
    super
  end
end

Child.send :include, FirstMixin
Child.send :include, SecondMixin

my_child = Child.new

class << my_child
  def identify
    puts "Meta"
    super
  end
end

my_child.identify

puts <<-Text
First the meta class, then the class itself, then the included modules (most recently included first), and then the superclass
Text


