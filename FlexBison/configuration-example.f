%{
#include <iostream>
using namespace std;
#define YY_DECL extern "C" int yylex()
%}
%%
\0 { cout << "ERR:L:" << yylineno << endl; exit(-1); }
[ \t\n] ;
host { cout << "HOST:" << yytext << endl; }
global { cout << "GLOBAL:" << yytext << endl; }
\{ { cout << "LBRACES:" << yytext << endl; }
\} { cout << "RBRACES:" << yytext << endl; }
= { cout << "EQ:" << yytext << endl; }
\; ;
[+-]?[0-9][0-9]*\.[0-9]+ { cout << "FLOAT:" << yytext << endl; }
[+-]?[1-9][0-9]* { cout << "INT:" << yytext << endl; }
\"([^"\\]|\\.)*\" { cout << "QUOTEDSTRING:" << yytext << endl; }
#.*$ { cout << "COMMENT:" << yytext << endl; }
[a-zA-Z_][a-zA-Z0-9_]* { cout << "KEY:" << yytext << endl; }
[a-zA-Z0-9\._\-]+ { cout << "HOSTNAME:" << yytext << endl; }
[a-zA-Z\/][a-zA-Z0-9_\-\.\/]* { cout << "VALUE:" << yytext << endl; }
. ;
%%

main() {
  /*
  FILE *myfile = fopen("../x1.cfg", "r");
  if (!myfile) { 
    cout << "I can't open a.snazzle.file!" << endl;
    return -1; 
  }
  yyin = myfile;
  */
  yylex();
}
