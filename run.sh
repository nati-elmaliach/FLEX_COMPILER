#!/bin/bash

lex try.lex
gcc lex.yy.c
./a.out
