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

        if {[string is digit -strict $char]} {
            set calval $char
        } else {
            set n 0
            set substr $char
            set parsed 0
            while {!$parsed} {
                for {set j 1} {$j < [array size table]} {incr j} {
                    # ver::
                    if {[$substr == [string range $table($j) 0 $n]]} {
                        incr n;
                        if{[string index $list($j) $n] == ""} {
                            set parsed 1
                            set calval $list($j)
                        }

                        append substr $char

                    } else {
                        set parsed 1
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
while {[gets $file line] >= 0} {
    set linevalue [calibrator_parser $line]
    #puts "linevalue = $linevalue"
    #set calval [expr {$calval + $linevalue}]
}

#puts "Answer: $calval"
exit
