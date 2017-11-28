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

# find out OS constant
LOCALOS=undefined
if [[ "$OSTYPE" == "darwin"* ]]; then
    LOCALOS=MacOS
elif [[ "$OSTYPE" == "linux"* ]]; then
    LOCALOS=Linux
fi

# the folder where the repository is
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ownfolder=$DIR/repo

if [[ "$testrun" == true ]]; then
    destfolder=$DIR/test_retrieve
    rm -Rf $destfolder
    mkdir -p $destfolder
else
    destfolder=$ownfolder
fi

# Copy over the iTerm preference
if [[ "$LOCALOS" == "MacOS" ]]; then
    iTermPref_Name=com.googlecode.iterm2.plist
    iTermPref_Source=$HOME/Library/Preferences/$iTermPref_Name

    if [[ -f "$iTermPref_Source" ]]; then
        iTermPref_Dest=$destfolder/iterm
        mkdir -p $iTermPref_Dest

        if [[ -f "$iTermPref_Dest/$iTermPref_Name" ]]; then
            echo "iTerm preference exists, will be over-written."
        fi
        cp $iTermPref_Source $iTermPref_Dest
    fi
fi

# traversing the root home folder
ownhome=$ownfolder/home
desthome=$destfolder/home
mkdir -p $desthome
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
