#include <stdio.h>
#include <stdlib.h>
#include "util.h"
#include "errormsg.h"
#include "y.tab.h"

YYSTYPE yylval;

int yylex(void); /* prototype for the lexing function */

string tokname(int tok);
/*char *tokname(inmt*/

string toknames[] = {"ID", "STRING", "INT","DESPLIEGA","SI",
                     "OTRO","AND","OR","NOT","DIFER","IGUAL",
                     "ENTERO","MIENTRAS","FLOTANTE","MYIGUAL","MRIGUAL","FLOAT","DEFINE","REGRESA"};


string tokname(tok) {
  return tok<258 || tok>299 ? "TOKEN NO VALIDO" : toknames[tok-258];
}


extern int yyparse(void);

void parse(string fname) 
{EM_reset(fname);
 if (yyparse() == 0){ 
   fprintf(stderr,"Programa Simple sintácticamente correcto!\n");
 }
 else fprintf(stderr,"Programa Simple con errores\n");
}


int main(int argc, char **argv) {
 string fname; int tok;
 if (argc!=2) {fprintf(stderr,"uso: %s archivo.mlp\n",argv[0]); exit(1);}
 fname=argv[1];
 EM_reset(fname);

 parse(argv[1]);
/*
 for(;;) {
   tok=yylex();
   if (tok==0) break;
   else if(tok<=255)
     printf("%c \n",tok);
     else
       switch(tok) {
         case ID: case STRING:
           printf("%10s %4d %s\n",tokname(tok),EM_tokPos,yylval.sval);
           break;
         case INT:
           printf("%10s %4d %d\n",tokname(tok),EM_tokPos,yylval.ival);
           break;
         case FLOTANTE:
           printf("%10s %4d %f\n",tokname(tok),EM_tokPos,yylval.fval);
           break;
         default:
           printf("%10s %4d\n",tokname(tok),EM_tokPos);
       }
 }*/
 return 0;

}
