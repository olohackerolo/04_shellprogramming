#!/bin/bash

echo -n "너의 선택은? (yes/no): "
read CHOICE

case $CHOICE in
    yes|Y|YES|y|Yes) echo "[  OK  ] Oh YES~~~~" ;;
    no|N|NO|n|No)    echo "[ FAIL ] Oh N~~~o~~~" ;;
    *)  echo "[ FAIL ] yes 또는 no을 입력하지 않았네요."
        exit 1 ;;
esac
