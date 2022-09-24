#!/usr/bin/env bash

EDITOR=nano
ZET=~/zet

mkdir -p $ZET

Usage() {
  printf "%s\n" "$0: an optionated note-taking system"
  printf "  %s\n" "-n -- create a new zettel and open it using $EDITOR"
  printf "  %s\n" "-m <string> -- create a new named zettel and open it using $EDITOR"
  printf "  %s\n" "-t <string> -- filter zettels in $ZET by the given tag"
  exit
}

NewZettel() {
  local zet_name=$1
  local zet_id=$(date +%S%M%H%d%m%y);
  zet_path="$ZET/${zet_name}${zet_id}.txt"
  (touch $zet_path)
  echo "created zettel with id #$zet_id in $ZET"
}

ZettelFindByTag() {
  local tag=$1
  zet_filtered=""

  for zets in "$ZET/*.txt"; do
    if grep "@BOOK $1" $zets &> /dev/null ; then
      zet_filtered="$zet_filtered $zets"
    fi
  done
}

ZettelCulminate() {
  local tag=$1
  ZettelFindByTag $tag

  for zet in $zet_filtered; do 
    echo `cat $zet | tail -n +3`
  done
}

OpenZettel() {
  $EDITOR $1
}

while getopts ":nm:t:" flag; do
  case $flag in 
    "n")
      NewZettel ""
      OpenZettel $zet_path
      ;;
    "m")
      # if the user has also passed "-n" 
      rm $zet_path &> /dev/null
      NewZettel $OPTARG
      ;;
    "t")
      ZettelCulminate $OPTARG
      ;;
    *) 
      Usage
      ;;
    esac
done
