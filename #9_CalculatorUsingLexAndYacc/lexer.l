%{
   #include<stdio.h>
   #include<stdlib.h>
   #include "calc.tab.h"
%}
%option noyywrap
%%
([1-9][0-9]+|[0-9])?(\.[0-9]+)?  {
      yylval.val = strtod(yytext,NULL);
      return NUMBER;
   }
   [ \t]  ;
   [\n] return 0;
   . return yytext[0];
   %%
   
