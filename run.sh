#!/bin/sh

WATCH="${HUGO_WATCH:=false}"
HUGO_SOURCE="${HUGO_SOURCE:=/src}"
HUGO_DESTINATION="${HUGO_DESTINATION:=/output}"
echo "HUGO_WATCH:" $WATCH
echo "HUGO_THEME:" $HUGO_THEME
echo "HUGO_BASEURL" $HUGO_BASEURL
echo "ARGS" $@

HUGO=/usr/local/sbin/hugo
echo "Hugo path: $HUGO"

while [ true ]
do
    $HUGO server --watch=$WATCH --source="$HUGO_SOURCE" --theme="$HUGO_THEME" --destination="$HUGO_DESTINATION" --baseURL="$HUGO_BASEURL" --appendPort=false --disableLiveReload --cleanDestinationDir "$@" || exit 1
done
