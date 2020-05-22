#ifndef PARSE_H
#define PARSE_H

#include "Token.h"
FILE* yyout_syn;
Token t;

void parser();
void match(eTOKENS tk);
char* getTokenName(eTOKENS t);
void parse_PROG();
void parse_GLOBAL_VARS();
void parse_FUNC_PREDEFS();
void parse_FUNC_FULL_DEFS();
void parse_VAR_DEC();
void parse_GLOBAL_VARS_();
void parse_FUNC_PROTOTYPE();
void parse_FUNC_PREDEFS_();
void parse_FUNC_WITH_BODY();
void parse_FUNC_FULL_DEFS_();
void parse_TYPE();
void parse_VAR_DEC_();
void parse_DIM_SIZES();
#endif
