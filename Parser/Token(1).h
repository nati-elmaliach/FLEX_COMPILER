#ifndef TOKEN_H
#define TOKEN_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern FILE *yyin, *yyout;

typedef enum eTOKENS
{
	TOKEN_INT_NUM,
	TOKEN_FLOAT_NUM,
	
	TOKEN_IDENTIFIR,
	
	TOKEN_OPERTAOR_ADDITION,
	TOKEN_OPERTAOR_MULTIPLICATION,

	TOKEN_COMPARISION_LESS,
	TOKEN_COMPARISION_LESS_EQUAL,
	TOKEN_COMPARISION_GE_EQ,
	TOKEN_COMPARISION_GE,
	TOKEN_COMPARISION_EQUAL,
	TOKEN_COMPARISION_NOT_EQUAL,

	TOKEN_ASSIGNMENT,

	TOKEN_KEYWORD_IF,
	TOKEN_KEYWORD_INT,
	TOKEN_KEYWORD_FLOAT,
	TOKEN_KEYWORD_VOID,
	TOKEN_KEYWORD_RETURN,

	TOKEN_COMMA_SEP_SIGN,
	TOKEN_COLON_SEP_SIGN,
	TOKEN_SEMICOLON_SEP_SIGN,
	TOKEN_PARANTHESES_OPEN,
	TOKEN_PARANTHESES_CLOSE,
	TOKEN_BRACKETS_OPEN,
	TOKEN_BRACKETS_CLOSE,
	TOKEN_CURLY_OPEN,
	TOKEN_CURLY_CLOSE,

	TOKEN_MULTILINE_COMMENT,
	TOKEN_NEW_LINE,
	TOKEN_WHILE,
	TOKEN_OP_EQUAL,
	TOKEN_END_OF_FILE
	
	/*
		Examples of tokens, add/change according to your needs.
		
		Alternative way to define tokens:
		#define TOKEN_INTEGER 1
		#define TOKEN_IF 2
		...........
	*/
}eTOKENS;

typedef struct Token
{
	eTOKENS kind;
	char *lexeme;
	int lineNumber;
}Token;

typedef struct Node
{
	Token *tokensArray;
	struct Node *prev;
	struct Node *next;
} Node;

void create_and_store_token(eTOKENS kind, char* lexeme, int numOfLine);
Token *next_token();
Token *back_token();

#endif

