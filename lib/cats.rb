class Cats
  attr_accessor :name, :id

  def initialize (name, id)
    @name, @id = name, id
  end

  def show_action
    yield if block_given?
  end

  def demo_threetype_param(name, *argc, &block)
    yield block
    puts "#{name},#{argc},#{block}"
  end
end