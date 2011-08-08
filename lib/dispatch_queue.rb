class DispatchQueue
  VERSION = "1.0.4"
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
    @procs.map do |proc|
      Thread.new{ proc.call }
    end.map do |thread|
      yield thread.value
    end
  end
end


DQ = DispatchQueue

