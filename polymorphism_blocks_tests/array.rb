class ArrayMethods
  attr_reader :array

  def initialize(array)
    self.array = array
  end

  private def array=(array)
    @array = array
  end

  def cycle(number)
    number.times do
      for element in array
        yield (element) if block_given?
      end
    end
    nil
  end

