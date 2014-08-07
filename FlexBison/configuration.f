%{
#include "configuration.tab.h"
#define YY_DECL extern "C" int yylex()
#include <iostream>
using namespace std;
bool eq = false;
bool hostname = false;
int line_key = 0;
%}
%option noyywrap
%option yylineno

%%
\0 { cout << "ERR:L:" << yylineno << endl; exit(-1); }
[ \t\n] ;
host { hostname = true; return HOST; }
global { yylval.kval = strdup(yytext); if (hostname) {hostname = false; return HOSTNAME; } if (eq) { eq = false; return STRING; } return GLOBAL; }
\{ { return LBRACES; }
\} { return RBRACES; }
= { eq = true; return EQ; }
\; { return SEMICOLON; }
[+-]?[0-9][0-9]*\.[0-9]* { if(line_key != yylineno) { cout << "ERR:L:" << yylineno << endl; exit(-1); } yylval.fval = strdup(yytext); eq = false; return FLOAT; }
[+-]?[0-9][0-9]* { if(line_key != yylineno) { cout << "ERR:L:" << yylineno << endl; exit(-1); } yylval.ival = strdup(yytext); eq = false; return INT; }
\"([^"\\]|\\.)*\" { if(line_key != yylineno) { cout << "ERR:L:" << (yylineno-1) << endl; exit(-1); } yylval.qval = strdup(yytext); eq = false; return QUOTEDSTRING; }
#.*$ ;
[a-zA-Z_][a-zA-Z0-9_]* { line_key = yylineno; yylval.kval = strdup(yytext); if (hostname) {hostname = false; return HOSTNAME; } if (eq) { eq = false; return STRING; } return KEY; }
[a-zA-Z0-9\._\-]+ { yylval.hval = strdup(yytext); hostname = false; return HOSTNAME; }
[a-zA-Z\/][a-zA-Z0-9_\-\.\/]* { if(line_key != yylineno) { cout << "ERR:L:" << yylineno << endl; exit(-1); }  yylval.sval = strdup(yytext); eq = false; return STRING; }
. { cout << "ERR:L:" << yylineno << endl; exit(-1); }
%%
