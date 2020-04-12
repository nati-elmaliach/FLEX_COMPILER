%option noyywrap

%{
int counter = 0;
int numOfLine = 0;
#include <stdlib.h>
#include <stdio.h>
#include "Token.h"
#include "Token.c"
%}

INT_NUM  [0-9]|([1-9][0-9]*)
FLOAT_NUM [-+]?[0-9]*\.?[0-9]+([eE][-+]?[0-9]+)?.
%%

[ \t\n] 			{}

{INT_NUM}			{create_and_store_token(TOKEN_INTEGER,yytext,numOfLine);
				 fprintf(yyout,"Line %d: found token of type INT_NUM , lexeme %s\n", 							numOfLine,yytext);
				return 1;}

{FLOAT_NUM}			{create_and_store_token(TOKEN_FLOAT,yytext,numOfLine);
				 fprintf(yyout,"Line %d: found token of type FLOAT_NUM , lexeme %s\n", 							numOfLine,yytext);
				return 1;}


%%

int main(int argc, char **argv ){
	++argv, --argc;  /* skip over program name */
	if ( argc > 0 )
	yyin = fopen( argv[0], "r" );
	else
	yyin = stdin;


	if ( argc > 1 )
	yyout = fopen( argv[1], "w" );
	else
	yyout = stdout;

	yylex();
}
