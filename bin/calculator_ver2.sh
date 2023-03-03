#!/bin/bash

echo -n "Enter number 1 : "
read NUM1

echo -n "Enter OP (+|-|\*|/):"
read OP

echo -n "Enter number 2 : "
read NUM2

if [ "$OP" = '+' ] ; then
    :
elif [ "$OP" = '-' ] ; then
    :
elif [ "$OP" = '*' ] ; then
    expr $NUM1 \* $NUM2
elif [ "$OP" = '/' ] ; then
    :
else
    :
fi
