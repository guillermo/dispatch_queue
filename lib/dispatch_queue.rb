class DispatchQueue
  VERSION = "1.0.5"
  include Enumerable


  def self.[](*procs)
    procs.map { |proc|
      Thread.new{ proc.to_proc.call }
    }.map { |thread|
      thread.value
    }
  end
end


DQ = DispatchQueue

