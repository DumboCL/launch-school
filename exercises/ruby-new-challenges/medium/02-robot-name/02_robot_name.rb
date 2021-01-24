class Robot
  ALPHABET = ('A'..'Z').to_a.freeze

  @@names = []

  def name
    return @name if @name

    @name = generate_name until name_valid?(@name)
    @@names << @name
    @name
  end

  def reset
    @@names.delete(@name)
    @name = nil
  end

  private

  def generate_name
    ALPHABET.sample + ALPHABET.sample + rand(100..999).to_s
  end

  def name_valid?(name)
    !@@names.include?(name)
  end
end

p Robot.new.name