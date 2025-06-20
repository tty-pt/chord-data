#!/bin/sh

translate() {
	iconv -f utf-8 -t ascii//TRANSLIT | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9 ]//g' | sed 's/ /_/g'
}

for line in [0-9]*; do
# ls | while read line; do
	id="`cat $line/title | translate`"
	# echo $line | grep -qE '^[0-9]+$' || continue
	# echo $id
	# git rm -r $id
	rm -rf $line
	cp -r $line $HOME/chords/$id
done
