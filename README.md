DispatchQueue
=============

DispatchQueue is a simple way to serialize jobs. 
It was done for crawling things, but could be used in any case that you need to do more than one work at a time.

With this line, we get more documentation that real code, so please see the code.


COMPATIBILITY
=============

It works with ruby 1.8 and ruby 1.9, and probably other rubies.

USAGE
=====

* The explicit way:

    my_work_queue = DispatchQueue.new(lambda{ sleep 3 ; 5},  lambda{ 10 })
    my_work_queue.sort #=> [5, 10]

* The implicit way:

    DQ[ lambda{ sleep 5 ; 3} , Proc.new{ sleep 6; 2 } ].sort #=> [2,3]


LICENSE
=======

"THE BEER-WARE LICENSE" (Revision 42):
<guillermo@cientifico.net> wrote this file. As long as you retain this notice you
can do whatever you want with this stuff. If we meet some day, and you think
this stuff is worth it, you can buy me a beer in return Guillermo Álvarez Fernández
