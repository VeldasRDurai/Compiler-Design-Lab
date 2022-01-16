%{
   #include<stdio.h>
%}

%union {
   float val;
}
%token NUMBER
%left '+' '-'
%left '*' '/'
%left '(' ')'

%%
ArithmeticExpression: E{ 
   printf("\nResult=%g\n", $<val>$ ); 
   return 0; 
};

E:  E '+' E { $<val>$=$<val>1+$<val>3; }
|  E '*' E   { $<val>$=$<val>1*$<val>3; }
|  E '-' E   { $<val>$ = $<val>1-$<val>3; }
|  E '/' E   { $<val>$ = $<val>1/$<val>3; }
|  '(' E ')' { $<val>$ = $<val>2; }
|  NUMBER { $<val>$ = $<val>1; }
;
%%

void main() {
   printf("\nEnter an expression which can have operators +,-,*,? and paratheses :\n");
   yyparse();
}

void yyerror(){
   printf("\nEntered arithematic expression is invalid\n\n");
}
