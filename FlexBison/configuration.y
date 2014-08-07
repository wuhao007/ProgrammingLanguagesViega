%{
#include "configuration.tab.h"
#include <cstdio>
#include <iostream>
#include <set>

using namespace std;

extern "C" int yylex();
extern "C" int yyparse();
extern "C" int yylineno;
extern "C" FILE *yyin;

void yyerror(const char *s);
bool global_block = false;
bool host_block = false;
set<string> global_override;
set<string> host_override;
string cat("");
//string correct_content("");
int line_num = -1;
void check_lineno()
{
  if (line_num == yylineno)
  {
    cout << "ERR:P:" << yylineno << endl;
    yyerror("line_num");
  }
  else
    line_num = yylineno;
}
void string_cat(string type, string key, string value, bool O = false, bool quoted = false)
{
  cat += ("    " + type + ":");
  if (O)
  {
    cat += "O";
  }
  cat += (":" + key + ":");
  if (quoted)
  {
    cat += "\"\"";
  }
  cat += value;
  if (quoted)
  {
    cat += "\"\"";
  }
  cat += "\n";
};

bool override(string key)
{
  bool result = false;
  if (global_override.find(key) != global_override.end())
    result = true;
  if (global_block)
  {
    global_override.insert(key);
  }
  if (host_block)
  {
    if (host_override.find(key) != host_override.end())
      result = true;
    host_override.insert(key);
  }
  return result;
};

string escape(string quotedstring)
{
  string escaped_string("");
  typedef string::size_type string_size;
  string_size i = 0;
  while (i < quotedstring.size())
  {
    if (quotedstring[i] == '\\')
    {
      if (quotedstring[i+1] == 'n')
      {
        escaped_string += "\n";
        i++;
      }
      else if (quotedstring[i+1] == 'r')
      {
        escaped_string += "\r";
        i++;
      }
      else if (quotedstring[i+1] == '\\')
      {
        escaped_string += "\\";
        i++;
      }
    }
    else
    {
      escaped_string += quotedstring[i];
    }
    i++;
  }
  return escaped_string;
};
%}

%union {
  char* ival;
  char* fval;
  char* qval;
  char* kval;
  char* sval;
  char* hval;
}
%token HOST
%token GLOBAL
%token LBRACES
%token RBRACES
%token SEMICOLON
%token EQ

%token <ival> INT
%token <fval> FLOAT
%token <qval> QUOTEDSTRING
%token <kval> KEY
%token <sval> STRING
%token <hval> HOSTNAME

%%

configuration:
global
| global hosts
;
hosts:
hosts host
| host
;
global:
{
  global_block = true;
  host_block = false;
  cat += ("GLOBAL:\n");
  }
  GLOBAL LBRACES statements RBRACES semicolon
{
  cout << cat;
  cat = "";
}
  ;
semicolon:
  | SEMICOLON
  ;
statements:
  statement
  | statements statement
  |
  ;
statement:
  KEY EQ INT
  {
    check_lineno();
    string_cat("I", $1, $3, override($1));
  }
  | KEY EQ FLOAT
  {
    check_lineno();
    string_cat("F", $1, $3, override($1));
  }
  | KEY EQ STRING
  {
    check_lineno();
    string_cat("S", $1, $3, override($1));
  }
  | KEY EQ QUOTEDSTRING
  {
    check_lineno();
    string_cat("Q", $1, escape($3), override($1), true);
  }
  ;
host:
  {
    host_override.clear();
    global_block = false;
    host_block = true;
    cat += "HOST ";
  }
  HOST hostname LBRACES statements RBRACES semicolon
{
  cout << cat;
  cat = "";
}
  ;
hostname:
  HOSTNAME
  {
    cat += (string($1) + ":\n");
  }
  ;

%%

int main()
{
  FILE *myfile = fopen("test.cfg", "r");
  if (!myfile) {
    cout << "ERR:F:" << endl;
    return -1;
  }
  yyin = myfile;
  do
  {
    yyparse();
  }
  while (!feof(yyin));
  //cout << cat;
  //cout << correct_content;
  return 0;
}

void yyerror(const char *s)
{
  cout << "ERR:P:" << yylineno << endl;
  exit(-1);
}
