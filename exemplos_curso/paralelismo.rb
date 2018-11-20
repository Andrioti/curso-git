thr1 = Thread.new {
    puts "ola Thread=1"
}

thr2 = Thread.new {
    puts "ola Thread=2"
}


#injeta a thread na main
thr1.join
#injeta a thread na main
thr2.join
