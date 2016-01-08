#!/bin/sh

set -e

echo "digraph lattice {"

shape="shape=Mrecord, style=filled,"
#git rev-list --pretty=format:commit" %h|%cd|%an: %s" --date=short "$@" |
git rev-list --date=short --pretty=format:"%H %h %ad|%an:%s" HEAD |
        sed "s/[\"\{\}()<>]/\\\\&/g" |
        sed -n "s/^\([0-9a-f]\{40\}\) \(.*\)$/n\1 [$shape label=\"{\2}\"]/p" |
        sed "s/ohli/Oliver Friedrich/g" |
        sed "s/MarkoKle/Marko Klepatz/g" |
        sed "s/zottelbeyer/Klaus Steinhauer/g"

git rev-list --parents "$@" |
        while read commit parents
        do
                for p in $parents
                do
                        echo "n$commit -> n$p"
                done
        done

echo "}"
