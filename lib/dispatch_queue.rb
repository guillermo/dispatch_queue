class DispatchQueue
  VERSION = "1.0.1"
  include Enumerable

  class << self
    alias :[] :new
  end

  def initialize(*array)
    @procs = array
  end

  def <<(new_one)
    @procs << new_one
  end

  def each
    @all = @procs.map do |proc|
      Thread.new{ proc.call }.value.tap{|value| yield value}
    end
  end
end


DQ = DispatchQueue

