LOG=~/src/rcisneros/hrg/scripts/auto/test.txt

rm $LOG

ulimit -c unlimited

for ((i=0; i<100; i++)); do

    echo "$i" >> $LOG
    
    cd ~/src/hrg/workspace/HRP2KAI/
    
    rm core
    choreonoid test-tilt-estimator.cnoid --start-simulation &

    CHOREONOID=$!

    sleep 15s

    c=`ps -ef | grep choreonoid | grep -v grep | wc -l`
    if [ $c = 0 ]; then
        echo "failed" >> $LOG
        exit 1
    fi

    echo "succeeded" >> $LOG
    
    kill -9 $CHOREONOID

done
