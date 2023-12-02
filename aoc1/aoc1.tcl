proc calibrator_parser {t} {

    set first_f 1
    for {set i 0} {$i < [string length $t]} {incr i} {
        set char [string index $t $i]

        if {[string is digit -strict $char]} {

            if {$first_f} {
                set first $char
                set first_f 0
            }

            set last $char
        }

    }
    return $first$last
}

set filename [lindex $argv 0]
set file [open $filename "r"]

set calval 0


while {[gets $file line] >= 0} {
    set linevalue [calibrator_parser $line]
    #puts "linevalue = $linevalue"
    set calval [expr {$calval + $linevalue}]
}

puts "Answer: $calval"
exit
