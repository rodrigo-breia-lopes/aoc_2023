proc calibrator_parser {t} {

    set lista(1) "one"
    set lista(2) "two"
    set lista(3) "three"
    set lista(4) "four"
    set lista(5) "five"
    set lista(6) "six"
    set lista(7) "seven"
    set lista(8) "eight"
    set lista(9) "nine"

    set first_f 1
    set calval ""
    for {set i 0} {$i < [string length $t]} {incr i} {
        set char [string index $t $i]

        if {[string is digit -strict $char]} {
            set calval $char
        } else {

            set ok 1
            set substr $char
            set n 0 

            while {$ok} {
                # iterar por cada lookup
                for {set j 1} {$j < 9} {incr $j} { 
                    puts "$j: \ts: $substr\t r:$[string range $lista($j) 0 $n]"
                    # comprar s(1:n) == lista(j)(1:n)
                    if {$substr == [string range $lista($j) 0 $n]} {
                        incr n
                        if {[string index $lista($j) $n] == ""} {
                            set calval $j 
                            set ok 0
                        }

                        append substr $char

                    } else {
                        set n 0
                        set ok 0
                        set substr ""
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
