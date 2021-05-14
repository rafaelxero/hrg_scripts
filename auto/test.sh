LOG=~/src/rcisneros/hrg/scripts/auto/test.txt

cd ..

for ((i=0; i<20; i++)); do

    echo "$i" >> $LOG

done
