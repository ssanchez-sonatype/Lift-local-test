#!/bin/bash

if [[ $# -le 0 ]]
then
    printf "Not enough arguments!\n"
    exit
fi

TIMEOUT=$1
VARIABLE=0

while :
do
  ((VARIABLE = VARIABLE + 1))
  read -t $TIMEOUT -p "Do you want to Quit(Y/N): "
  if [ $VARIABLE -gt $TIMEOUT ]; then
    echo "Timing out - user response took too long!"
    break
  fi

  case $REPLY in
  [yY]*)
    echo "Quitting!"
    break
    ;;
  [nN]*)
    echo "Do not quit!"
    ;;
  *) echo "Please choose Y or N!"
     ;;
  esac
done
