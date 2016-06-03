#!/bin/zsh
d=${0:a:h:h}
# backup
h=${0:a:h}
if cat $j|jq . ;then
	cp $j $h
fi
h=$h/PagesIndex.json
j=$d/static/bower_components/lunr.js/PagesIndex.json
t=`cat $j |jq '.[]'|sed -e 's#/post##g'`
a=`cat $j | sed -e 's#/post##g'`
echo $a >! $j
t=`echo $t|jq -r '.href'|cut -d - -f 1-4`

for (( i=1;i<=`echo "$t"|wc -l`;i++ ))
do
	f=`echo "$t"|awk "NR==$i"`
	c=`echo $f|tr '-' '/'`
	sed -i "" "s#${f}#${c}#g" $j
done

cat $j

diff $j $h
