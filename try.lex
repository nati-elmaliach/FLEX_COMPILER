%option noyywrap

%{
#include "Token.h"
#define _CRT_SECURE_NO_WARNINGS
int counter = 0;
int numOfLine = 1;
%}
%x comment


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
"\n"			{
					create_and_store_token(TOKEN_NEW_LINE,yytext,++numOfLine);
					return 1;
				}
"/*"  			{
					BEGIN(comment);
					
					<comment>[^*]*               
					<comment>"*"+[^*/]*                     
					<comment>"*"+"/"	BEGIN(INITIAL);
					
				}
				
<<EOF>>    		{
					create_and_store_token(TOKEN_END_OF_FILE, "", numOfLine);
					fprintf(yyout,"Line %d: found token of type EOF , lexeme %s\n",numOfLine,yytext);
					return 0;
				}
%%

int main( ){
yyin = fopen("C:\\Users\\ShiriLeizy\\source\\repos\\test1\\test1\\1.txt", "r");
yyout = fopen("C:\\Users\\ShiriLeizy\\source\\repos\\test1\\test1\\2.txt", "w");
while(yylex() != 0) { }
}
