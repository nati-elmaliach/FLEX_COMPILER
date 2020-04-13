%option noyywrap

%{
#include <stdlib.h>
#include <stdio.h>
#include "Token.h"
#include "Token.c"
#define _CRT_SECURE_NO_WARNINGS
int numOfLine = 0;
%}
INT_NUM   (^[0-9]$|[1-9][0-9]*)
FLOAT_NUM [1-9]+\.[1-9]+[eE][-+]?[1-9][0-9]*
%%
","				{
					create_and_store_token(TOKEN_COMMA_SEP_SIGN,yytext,numOfLine);
					fprintf(yyout,"Line %d: found token of type: Comma, Lexeme: %s\n",numOfLine,yytext);
					return 1;
				}
":"				{
					create_and_store_token(TOKEN_COLON_SEP_SIGN,yytext,numOfLine);
					fprintf(yyout,"Line %d: found token of type: Colon , Lexeme %s\n",numOfLine,yytext);
					return 1;
				}
";"				{
					create_and_store_token(TOKEN_COMMA_SEP_SIGN,yytext,numOfLine);
					fprintf(yyout,"Line %d: found token of type: Semicolon, Lexeme: %s\n",numOfLine,yytext);
					return 1;
				}
.*\(.*\)			{
					create_and_store_token(TOKEN_COMMA_SEP_SIGN,yytext,numOfLine);
					fprintf(yyout,"Line %d: found token of type: Parentheses , Lexeme: %s\n",numOfLine,yytext);
					return 1;
				}
.*\[.*\]			{
					create_and_store_token(TOKEN_COMMA_SEP_SIGN,yytext,numOfLine);
					fprintf(yyout,"Line %d: found token of type: Brackets , Lexeme: %s\n",numOfLine,yytext);
					return 1;
				}
.*\{.*\}		{
					create_and_store_token(TOKEN_COMMA_SEP_SIGN,yytext,numOfLine);
					fprintf(yyout,"Line %d: found token of type: Curly braces, Lexeme: %s\n",numOfLine,yytext);
					return 1;
				}	
			
"\n"				{++numOfLine;}					

<<EOF>>    		{
					create_and_store_token(TOKEN_END_OF_FILE, "", numOfLine);
					fprintf(yyout,"Line %d: found token of type EOF , lexeme %s\n",numOfLine,yytext);
					return 0;
				}
"/*"  			{
					BEGIN(comment);
					
					<comment>[^*]*               
					<comment>"*"+[^*/]*                     
					<comment>"*"+"/"	BEGIN(INITIAL);
					
				}


{FLOAT_NUM}		{
					create_and_store_token(TOKEN_FLOAT_NUM, yytext, numOfLine);
					fprintf(yyout,"Line %d: found token of type FLOAT_NUM , lexeme %s\n",numOfLine,yytext);
					return 1;
				}
	

{INT_NUM}		{
					create_and_store_token(TOKEN_INT_NUM, yytext, numOfLine);
					fprintf(yyout,"Line %d: found token of type INT_NUM , lexeme %s\n",numOfLine,yytext);
					return 1;
				}

"+"			{
					create_and_store_token(TOKEN_OPERTAOR_ADDITION, yytext, numOfLine);
					fprintf(yyout,"Line %d: found token of type TOKEN_OPERATOR_ADDITION , lexeme %s\n",numOfLine,yytext);
					return 1;
				}

"*"			{
					create_and_store_token(TOKEN_OPERTAOR_MULTIPLICATION, yytext, numOfLine);
					fprintf(yyout,"Line %d: found token of type TOKEN_OPERATOR_MULTIPLIATION , lexeme %s\n",numOfLine,yytext);
					return 1;
				}

"<"			{
					create_and_store_token(TOKEN_COMPARISION_LESS, yytext, numOfLine);
					fprintf(yyout,"Line %d: found token of type TOKEN_COMPARISION_LESS , lexeme %s\n",numOfLine,yytext);
					return 1;
				}

"<"			{
					create_and_store_token(TOKEN_COMPARISION_LESS, yytext, numOfLine);
					fprintf(yyout,"Line %d: found token of type TOKEN_COMPARISION_LESS , lexeme %s\n",numOfLine,yytext);
					return 1;
				}

"<="			{
					create_and_store_token(TOKEN_COMPARISION_LESS_EQUAL, yytext, numOfLine);
					fprintf(yyout,"Line %d: found token of type TOKEN_COMPARISION_LESS_EQUAL , lexeme %s\n",numOfLine,yytext);
					return 1;
				}
	
">="			{
					create_and_store_token(TOKEN_COMPARISION_GE_EQ, yytext, numOfLine);
					fprintf(yyout,"Line %d: found token of type TOKEN_COMPARISION_GE_EQ , lexeme %s\n",numOfLine,yytext);
					return 1;
				}

">"			{
					create_and_store_token(TOKEN_COMPARISION_GE, yytext, numOfLine);
					fprintf(yyout,"Line %d: found token of type TOKEN_COMPARISION_GE , lexeme %s\n",numOfLine,yytext);
					return 1;
				}

"=="			{
					create_and_store_token(TOKEN_COMPARISION_EQUAL, yytext, numOfLine);
					fprintf(yyout,"Line %d: found token of type TOKEN_COMPARISION_EQUAL , lexeme %s\n",numOfLine,yytext);
					return 1;
				}
"!="			{
					create_and_store_token(TOKEN_COMPARISION_NOT_EQUAL, yytext, numOfLine);
					fprintf(yyout,"Line %d: found token of type TOKEN_COMPARISION_NOT_EQUAL , lexeme %s\n",numOfLine,yytext);
					return 1;
				}

"="			{
					create_and_store_token(TOKEN_ASSIGNMENT, yytext, numOfLine);
					fprintf(yyout,"Line %d: found token of type TOKEN_ASSIGNMENT , lexeme %s\n",numOfLine,yytext);
					return 1;
				}
"if"			{
					create_and_store_token(TOKEN_KEYWORD_IF, yytext, numOfLine);
					fprintf(yyout,"Line %d: found token of type TOKEN_KEYWORD_IF , lexeme %s\n",numOfLine,yytext);
					return 1;
				}
"int"			{
					create_and_store_token(TOKEN_KEYWORD_INT, yytext, numOfLine);
					fprintf(yyout,"Line %d: found token of type TOKEN_KEYWORD_INT , lexeme %s\n",numOfLine,yytext);
					return 1;
				}

"float"			{
					create_and_store_token(TOKEN_KEYWORD_FLOAT, yytext, numOfLine);
					fprintf(yyout,"Line %d: found token of type TOKEN_KEYWORD_FLOAT , lexeme %s\n",numOfLine,yytext);
					return 1;
				}

"void"			{
					create_and_store_token(TOKEN_KEYWORD_VOID, yytext, numOfLine);
					fprintf(yyout,"Line %d: found token of type TOKEN_KEYWORD_VOID , lexeme %s\n",numOfLine,yytext);
					return 1;
				}

"return"			{
					create_and_store_token(TOKEN_KEYWORD_RETURN, yytext, numOfLine);
					fprintf(yyout,"Line %d: found token of type TOKEN_KEYWORD_RETURN , lexeme %s\n",numOfLine,yytext);
					return 1;
				}

%%

int main( ){
yyin = fopen("./int.txt", "r");
yyout = fopen("./out.txt", "w");
while(yylex() != 0) { }
}
