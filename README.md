DispatchQueue
=============

DispatchQueue is a simple way to serialize jobs. 
It was done for crawling things, but could be used in any case that you need to do more than one work at a time.

With this line, we get more documentation that real code, so please see the code.

[![Build Status](https://secure.travis-ci.org/guillermo/dispatch_queue.png)](http://travis-ci.org/guillermo/dispatch_queue)


COMPATIBILITY
=============

It works with ruby 1.8 and ruby 1.9, and probably other rubies.

USAGE
=====

* The explicit way:

```ruby
my_work_queue = DispatchQueue.new(lambda{ sleep 3 ; 5},  lambda{ 10 })
my_work_queue.sort #=> [5, 10]
```

* The implicit way:

```ruby
DQ[ lambda{ sleep 5 ; 3} , Proc.new{ sleep 6; 2 } ].sort #=> [2,3]
```


REALCODE
=======

```ruby

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

```

CHANGELOG
=========

* 1.0.5 Reduce implementation

LICENSE
=======

"THE BEER-WARE LICENSE" (Revision 42):
<guillermo@cientifico.net> wrote this file. As long as you retain this notice you
can do whatever you want with this stuff. If we meet some day, and you think
this stuff is worth it, you can buy me a beer in return Guillermo Álvarez Fernández
