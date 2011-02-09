#!/bin/bash

set -e

scripts=`dirname $0`
CalcEvents=$scripts/CalcEvents

for run in $*; do
    
    echo "--- $run ---"
    echo "GIVE"
    $CalcEvents g $run > $run/events/calc-g.txt
    echo "FIGHT"
    $CalcEvents f $run > $run/events/calc-f.txt
    echo "DELTA"
    $CalcEvents d $run/events/calc-g.txt $run/events/calc-f.txt > $run/events/calc-d.txt

done

