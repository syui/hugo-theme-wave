#!/bin/zsh
#github=github.com/users/syui/contributions_calendar_data
f=${0:a:h:h}/static/json/datas.json
u=gitlab.com/u/$USER/calendar
t=`curl -sL $u|grep '{"'`
echo ${t%,}|jq .
echo ${t%,} >! $f

