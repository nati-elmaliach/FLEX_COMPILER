#include "Parse.h"


void parser()
{
	parse_PROG();
	match(TOKEN_END_OF_FILE);
}
void match(eTOKENS tk)
{
	t = *next_token();
	if (t.kind != tk)
		fprintf(yyout_syn, "Expected token of type %s at line: %d,  Actual token of type '%s' lexeme: '%s'. \n", getTokenName(tk), t.lineNumber, getTokenName(t.kind), t.lexeme);
}

char* getTokenName(eTOKENS t)
{
	switch (t)
	{
	case TOKEN_INT_NUM: return "TOKEN_INT_NUM";
	case TOKEN_FLOAT_NUM: return "TOKEN_FLOAT_NUM";
	case TOKEN_IDENTIFIR: return "TOKEN_IDENTIFIR";
	case TOKEN_OPERTAOR_ADDITION: return "TOKEN_OPERTAOR_ADDITION";
	case TOKEN_OPERTAOR_MULTIPLICATION: return "TOKEN_OPERTAOR_MULTIPLICATION";
	case TOKEN_COMPARISION_LESS: return "TOKEN_COMPARISION_LESS";
	case TOKEN_COMPARISION_LESS_EQUAL: return "TOKEN_COMPARISION_LESS_EQUAL";
	case TOKEN_COMPARISION_GE_EQ: return "TOKEN_COMPARISION_GE_EQ";
	case TOKEN_COMPARISION_GE: return "TOKEN_COMPARISION_GE";
	case TOKEN_COMPARISION_EQUAL: return "TOKEN_COMPARISION_EQUAL";
	case TOKEN_COMPARISION_NOT_EQUAL: return "TOKEN_COMPARISION_NOT_EQUAL";
	case TOKEN_ASSIGNMENT: return "TOKEN_ASSIGNMENT";
	case TOKEN_KEYWORD_IF: return "TOKEN_KEYWORD_IF";
	case TOKEN_KEYWORD_INT: return "TOKEN_KEYWORD_INT";
	case TOKEN_KEYWORD_FLOAT: return "TOKEN_KEYWORD_FLOAT";
	case TOKEN_KEYWORD_VOID: return "TOKEN_KEYWORD_VOID";
	case TOKEN_KEYWORD_RETURN: return "TOKEN_KEYWORD_RETURN";
	case TOKEN_COMMA_SEP_SIGN: return "TOKEN_COMMA_SEP_SIGN";
	case TOKEN_SEMICOLON_SEP_SIGN: return "TOKEN_SEMICOLON_SEP_SIGN";
	case TOKEN_PARANTHESES_OPEN: return "TOKEN_PARANTHESES_OPEN";
	case TOKEN_PARANTHESES_CLOSE: return "TOKEN_PARANTHESES_CLOSE";
	case TOKEN_BRACKETS_OPEN: return "TOKEN_BRACKETS_OPEN";
	case TOKEN_BRACKETS_CLOSE: return "TOKEN_BRACKETS_CLOSE";
	case TOKEN_CURLY_OPEN: return "TOKEN_CURLY_OPEN";
	case TOKEN_CURLY_CLOSE: return "TOKEN_CURLY_CLOSE";
	case TOKEN_MULTILINE_COMMENT: return "TOKEN_MULTILINE_COMMENT";
	case TOKEN_NEW_LINE: return "TOKEN_NEW_LINE";
	case TOKEN_OP_EQUAL: return "TOKEN_OP_EQUAL";
	case TOKEN_END_OF_FILE: return "TOKEN_END_OF_FILE";
	}
}

void parse_PROG()
{
	fprintf(yyout_syn, "Rule (PROG-> GLOBAL_VARS FUNC_PREDEFS FUNC_FULL_DEFS)\n");
	parse_GLOBAL_VARS();
	parse_FUNC_PREDEFS();
	parse_FUNC_FULL_DEFS();
}
void parse_GLOBAL_VARS()
{
	fprintf(yyout_syn, "Rule (GLOBAL_VARS-> VAR_DEC GLOBAL_VARS_)\n");
	parse_VAR_DEC();
	parse_GLOBAL_VARS_();

}
void parse_FUNC_PREDEFS()
{
	fprintf(yyout_syn, "Rule (FUNC_PREDEFS-> FUNC_PROTOTYPE ; FUNC_PREDEFS_)\n");
	parse_FUNC_PROTOTYPE();
	parse_FUNC_PREDEFS_();
}
void parse_FUNC_FULL_DEFS()
{
	fprintf(yyout_syn, "Rule (FUNC_FULL_DEFS-> FUNC_WITH_BODY FUNC_FULL_DEFS_)\n");
	parse_FUNC_WITH_BODY();
	parse_FUNC_FULL_DEFS_();	
}
void parse_VAR_DEC()
{
	fprintf(yyout_syn, "Rule (VAR_DEC-> TYPE id VAR_DEC_)\n");
	parse_TYPE();
	parse_VAR_DEC_();
}
void parse_GLOBAL_VARS_()
{
	fprintf(yyout_syn, "Rule (GLOBAL_VARS_TAG-> EPSILON | VAR_DEC GLOBAL_VARS_)\n");
}
void parse_FUNC_PROTOTYPE()
{
	fprintf(yyout_syn, "Rule (FUNC_PROTOTYP-> RETURNED_TYPE id ( PARAMS ))\n");
}
void parse_FUNC_PREDEFS_()
{
	fprintf(yyout_syn, "Rule (FUNC_PREDEFS_-> EPSILON | FUNC_PROTOTYPE ; FUNC_PREDEFS_)\n");
}
void parse_FUNC_WITH_BODY()
{
	fprintf(yyout_syn, "Rule (FUNC_WITH_BODY-> FUNC_PROTOTYPE COMP_STMT)\n");
}
void parse_FUNC_FULL_DEFS_()
{
	fprintf(yyout_syn, "Rule (FUNC_FULL_DEFS_-> EPSILON | FUNC_FULL_DEFS)\n");
}
void parse_TYPE()
{
	fprintf(yyout_syn, "Rule (TYPE ->int | float)\n"); 
	t = *next_token();
	switch (t.kind)
	{
	case TOKEN_KEYWORD_INT:
		match(TOKEN_IDENTIFIR);
		break;
	case TOKEN_KEYWORD_FLOAT:
		match(TOKEN_IDENTIFIR);
		break;
	default:
		break;
	}
}
void parse_VAR_DEC_()
{
	fprintf(yyout_syn, "Rule (VAR_DEC_->; | [ DIM_SIZES ] ;)\n");
	t = *next_token();
	switch (t.kind)
	{
	case TOKEN_SEMICOLON_SEP_SIGN:
		break;
	case TOKEN_BRACKETS_OPEN:
		parse_DIM_SIZES();
		match(TOKEN_BRACKETS_CLOSE);
		match(TOKEN_SEMICOLON_SEP_SIGN);
		break;
	default:
		break;
	}
}
void parse_DIM_SIZES()
{
	fprintf(yyout_syn, "DIM_SIZES->int_num DIM_SIZES_)\n");
	t = *next_token();
	match(TOKEN_INT_NUM);

}
