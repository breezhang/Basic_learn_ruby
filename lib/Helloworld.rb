class Helloworld
   attr_accessor :title
   def initialize
      @title = 1
   end
   def say
      'helloworld'
   end

  def self.say
     'Helloworld ...init!'
  end
end