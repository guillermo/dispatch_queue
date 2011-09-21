class DispatchQueue
  VERSION = "1.1.0"

  def self.[](*procs)
    procs.map { |proc|
      Thread.new{ proc.to_proc.call }
    }.map { |thread|
      thread.value
    }
  end
end

module ArrayThreadedEnumerable
  def threaded_each
    threads = []
    each { |value|
      threads << Thread.new {
        yield value
      }
    }
    threads.each{|t| t.join}
  end

  def threaded_map
    values = []
    threaded_each { |value|
      value = yield value
      Thread.exclusive { values << value }
    }
    values
  end
end

Array.send(:include, ArrayThreadedEnumerable)

DQ = DispatchQueue

if RUBY_VERSION < "1.8.9999"
  class Thread
    def self.exclusive
      old_value = Thread.critical
      Thread.critical = true
      yield
    ensure
      Thread.critical = old_value
    end
  end
end

