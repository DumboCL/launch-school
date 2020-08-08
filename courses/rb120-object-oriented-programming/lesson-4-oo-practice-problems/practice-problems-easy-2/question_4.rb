class BeesWax
  attr_accessor :type

  def initialize(type)
    @type = type
  end

  # def type
  #   @type
  # end

  # def type=(t)
  #   @type = t
  # end

  def describe_type
    puts "I am a #{type} of Bees Wax"
  end
end

wax = BeesWax.new('type_A')
wax.describe_type