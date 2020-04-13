#!/bin/bash

lex try.lex
gcc lex.yy.c
./a.out
cat int.txt
cat out.txt
