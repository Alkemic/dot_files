#!/bin/bash

# compiles one files C in tmp folder and run it
ccc () { exec_name=`echo $1 | sed s/.c//`; gcc -o /tmp/$exec_name $1 && /tmp/$exec_name; }
