p "call me json | call me kk"


module Magic
  def singleton_method_added(name)
    puts "class method '#{name}' added"
    p self.public_send(name)
  end

  # @@b = []
  def self.included(base)
    #  @@b << base
    base.extend ClassMethods
  end

  module ClassMethods
    def method_added(name)
      puts "instance method '#{name}' added"

    end

    # def singleton_method_added(name)
    #   puts "class method '#{name}' added"
    # end
  end
end


class Foo
  include Magic

  def message
    p "Helloworld"
  end

  def self.google
    p '1111111111111111111'
  end


end

class Bar
  include Magic

  def getmessage

    p "2"

  end
end


# =begin
# module Abstract
#   def self.included(base)
#     base.extend(ClassMethods)
#   end
#
#   module ClassMethods
#     def abstract_methods(*args)
#       args.each do |name|
#         class_eval(<<-END, __FILE__, __LINE__)
#           def #{name}(*args)
#             raise NotImplementedError.new("You must implement #{name}.")
#         END
#       end
#     end
#   end
# end
#
# class Foobar
#   include Abstract
#
#   def hello
#
#   end
#
# end
# =end


# noinspection RubyUnusedLocalVariable
class Object
  def Object.profile(symbol)
    rename_symbol = ("rprof_" + symbol.to_s).to_sym
    alias_method rename_symbol, symbol
# Define the new method so as to add timing
# code.
    self.send(:define_method, symbol.to_s) do |*args|
      start_time = Time.now # self.send(rename_symbol, *args)
      puts (Time.now - start_time).to_s +  " have elapsed "
    end
    puts "The new method " + rename_symbol.to_s + "has been created for method " + symbol.to_s
  end
end


