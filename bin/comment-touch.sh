#!/bin/bash

d=content/post

if [ ! -d ../syui.gitlab.io-comment ];then
	git clone https://github.com/mba-hack/syui.gitlab.io-comment.git ../syui.gitlab.io-comment
fi
if [ -d ../${d} ];then
	mkdir -p ../syui.gitlab.io-comment/_posts
	f=$(echo -e "`ls -A ../${d}`\n`ls -A ../syui.gitlab.io-comment/_posts`" | sort | uniq -u)
	cd ../syui.gitlab.io-comment/_posts
	if [ -n "$f" ];then
		n=`echo "$f" | wc -l`
		echo $n
		for (( i=1;i<=$n;i++ ))
		do
			t=`echo "$f" | awk "NR==$i"`
			echo $t
			touch $t
			git add $t
			git commit -m "update"
			git push
		done
	fi
fi
