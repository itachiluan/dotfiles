#!/bin/bash

echo -n "Test run (y/n/q)? : "
read input
if [[ "$input" =~ [Yy] ]]; then
    testrun=true
elif [[ "$input" =~ [Nn] ]]; then
    testrun=false
else
    echo "Script exit."
    exit
fi

upperlevel() {
    # get the arbitrary upper level folder
    local ret=$1
    local upperlevel=$2

    for i in `seq 1 $upperlevel`; do
        ret=$(dirname $ret)
    done

    echo "$ret"
}

# the folder where the repository is
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ownfolder=$DIR/repo
ownhome=$ownfolder/home

if [[ "$testrun" == true ]]; then
    desthome=$DIR/test_retrieve
    rm -Rf $desthome
    mkdir -p $desthome
else
    desthome=$ownhome
fi

# traversing the root home folder
for file in $(find $ownhome -mindepth 1 -maxdepth 1 -type f | sort); do
    filename=$(basename $file)
    if [[ -f "$HOME/$filename" ]]; then
        cp "$HOME/$filename" $desthome
    fi
done

# traversing the folders
for folder in $(find $ownhome -mindepth 1 -maxdepth 1 -type d | sort); do
    foldername=$(basename $folder)
    if [[ -d "$HOME/$foldername" ]]; then
        cp -R "$HOME/$foldername" "$desthome"
    fi
done
