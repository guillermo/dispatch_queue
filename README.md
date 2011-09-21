DispatchQueue
=============

DispatchQueue is a simple way to serialize jobs. 
It was done for crawling things, but could be used in any case that you need to do more than one work at a time.



COMPATIBILITY
=============

Check build status to see support in different platforms

[![Build Status](https://secure.travis-ci.org/guillermo/dispatch_queue.png)](http://travis-ci.org/guillermo/dispatch_queue)

USAGE
=====

* The threaded_way:

```ruby

[1,2,3].threaded_each{|i|
  sleep 4-i
  puts i
}

```

    3
    2
    1

```ruby
[1,2,3].threaded_map{|i| sleep 4-i ; i } #=> [3,2,1]
```

* The explicit way:

```ruby
my_work_queue = DispatchQueue.new(lambda{ sleep 3 ; 5},  lambda{ 10 })
my_work_queue.sort #=> [5, 10]
```

* The implicit way:

```ruby
DQ[ lambda{ sleep 5 ; 3} , Proc.new{ sleep 6; 2 } ].sort #=> [2,3]
```



CHANGELOG
=========

* 1.1.0 Create [].threaded_each [].threaded_map (2011/09/22)
* 1.0.5 Reduce implementation


LICENSE
=======

"THE BEER-WARE LICENSE" (Revision 42):
<guillermo@cientifico.net> wrote this file. As long as you retain this notice you
can do whatever you want with this stuff. If we meet some day, and you think
this stuff is worth it, you can buy me a beer in return Guillermo Álvarez Fernández
