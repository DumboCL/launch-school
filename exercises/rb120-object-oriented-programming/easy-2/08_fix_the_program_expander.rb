class Expander
  def initialize(string)
    @string = string
  end

  def to_s
    self.expand(3)
  end

  protected

  def expand(n)
    @string * n
  end
end

expander = Expander.new('xyz')
puts expander