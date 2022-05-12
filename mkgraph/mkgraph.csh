#!/bin/csh -f 
rm path/plot.*

cp sourcepath/`date +\%Y\%m\%d -d '1 days ago'`.csv path/now.txt
sed -e 's/,//g' path/now.txt > path/plot.txt


gnuplot path/mkgraph.gp 

ps2pdf path/plot.eps path/plot.pdf 

mv path/plot.pdf /var/www/html/path/`date +\%Y\%m\%d -d '1 days ago'`.pdf


cat sourcepath/`date +\%Y\%m -d '1 days ago'`*.csv > path/now.txt
sed -e 's/,//g' path/now.txt > path/plot.txt

gnuplot path/mkgraph.gp

ps2pdf path/plot.eps path/plot.pdf

mv path/plot.pdf /var/www/html/path/`date +\%Y\%m -d '1 days ago'`.pdf

