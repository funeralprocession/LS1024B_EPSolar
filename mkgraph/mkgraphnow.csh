#!/bin/csh -f 
rm path/plot.*

cp sourcepath/`date +\%Y\%m\%d`.csv path/now.txt
sed -e 's/,//g' path/now.txt > path/plot.txt


gnuplot path/mkgraph.gp 

ps2pdf path/plot.eps path/plot.pdf 

mv path/plot.pdf /var/www/html/path/`date +\%Y\%m\%d`.pdf

