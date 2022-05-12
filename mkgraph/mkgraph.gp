
set terminal postscript landscape enhanced color 
set size 1,0.7
set grid ytics
set key below 
set ylabel 'Voltage [V]' 
set output 'path/plot.eps' 
set format y "%4.3f"
set xdata time
set timefmt "%Y-%m-%d %H:%M:%S"
set format x "%m/%d\n%H:%M"
plot "path/plot.txt" using 1:5 with lines title "Lead"
set out

