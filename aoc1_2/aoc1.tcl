proc calibrator_parser {t} {

    set table(1) "one"
    set table(2) "two"
    set table(3) "three"
    set table(4) "four"
    set table(5) "five"
    set table(6) "six"
    set table(7) "seven"
    set table(8) "eight"
    set table(9) "nine"

    set first_f 1
    set calval ""

    for {set i 0} {$i < [string length $t]} {incr i} {
        set char [string index $t $i]
        puts $i
        if {[string is digit -strict $char]} {
            set calval $char
        } else {
            set cc ""
            set n 0   
            set test 1
            while {$test} {

                set cc $cc$char
                for {set j 1} {$j <= 9} {incr j} {
                    set tt [string range $table($j) 0 $n]
                    puts "in: $cc\t test: $tt\n"
                    if {$j == 9 && $n == 3} {exit}
                    if {$cc == $tt} {
                        if {$tt == $table($j)} {
                            set n 0
                            set calval $j
                            set test 0
                            set cc ""
                        } 

                        incr n

                    } else {
                        if {$j >= 9} {
                            set n 0
                            set cc ""
                            set test 0
                        }
                        set test 1
                    }
                }
             
            }
        }

        if {$first_f} {
                set first $calval
                set first_f 0
        }

        set last $calval


    }
    return $first$last
}

set filename [lindex $argv 0]
set file [open $filename "r"]

set calval 0

# number parser
##set a 1
while {[gets $file line] >= 0} {
    set linevalue [calibrator_parser $line]
    #puts "linevalue = $linevalue"
    #set calval [expr {$calval + $linevalue}]
}

#puts "Answer: $calval"
exit
