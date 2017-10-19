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

# Setup for OS constant
LOCALOS=undefined
if [[ "$OSTYPE" == "darwin"* ]]; then
    LOCALOS=MacOS
elif [[ "$OSTYPE" == "linux"* ]]; then
    LOCALOS=Linux
fi

# find out where the script is
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# define where the repository is
source_dir=$DIR/repo
if [[ "$testrun" = true ]]; then
    dest_home=$DIR/test_deploy
    mkdir -p $dest_home
else
    dest_home=$HOME
fi

# Copy iTerm preferences
if [[ "$LOCALOS" == "MacOS" ]]; then
    if [[ "$TERM_PROGRAM" == "iTerm"* ]]; then
        echo "Warning: iTerm preferences is not copied. Use Apple Terminal.app to run this script."
    else
        iTermPref_Name=com.googlecode.iterm2.plist
        iTermPref_Source=$source_dir/iterm/$iTermPref_Name

        if [[ -f "$iTermPref_Source" ]]; then
            iTermPref_Dest=$dest_home/Library/Preferences
            mkdir -p $iTermPref_Dest
            if [[ -f "$iTermPref_Dest/$iTermPref_Name" ]]; then
                echo "iTerm preference exists, will be over-written."
            fi
            cp $iTermPref_Source $iTermPref_Dest
        fi
    fi
fi

# copy all the home directory dot files
for file in $( find $source_dir/home -maxdepth 1 -type f | sort ); do
    cp $file $dest_home
done

# copy all home directory folders
for directory in $( find $source_dir/home -mindepth 1 -maxdepth 1 -type d | sort); do
    if [[ -d $directory ]]; then
        rm -rf $dest_home/$directory
    fi
    cp -R $directory $dest_home
done
