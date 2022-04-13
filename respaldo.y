%{
  #include <stdio.h>
  
%}

%union{		
		int pos;
   	int ival;
   	float fval;
    char* sval;
};

%token ID
%token <sval> STRING
%token <ival> INT
%token DESPLIEGA
%token SI
%token OTRO
%token AND
%token OR
%token NOT
%token DIFER
%token IGUAL
%token ENTERO
%token MIENTRAS
%token FLOTANTE
%token MYIGUAL
%token MRIGUAL
%token <fval> FLOAT
%token REGRESA
%token DEFINE


%left ';'
%left '+' '-'
%left '*' '/'

%start programa
%%

programa: lista_declVars lista_declFuncion SecPpal
					| lista_declFuncion SecPpal
				;

lista_declVars: variable';'
			| variable';'lista_declVars
    ;

variable: tipo ID
			| tipo ID '=' exp
			;
lista_declFuncion:declFuncion  
		;


declFuncion: proto_funcion '{' bloque_funcion '}'
			;
bloque_funcion:  lista_sentencias 




		 lista_sentencias: sentencia';'
						| sentencia';' lista_sentencias
		
					;

		sentencia: variable
				| ID '=' exp
				;

proto_funcion: DEFINE ID '(' lista_params')' ':' tipo
				|DEFINE ID '(' ')' ':' tipo
		;


		lista_params: param
					| param','lista_params
				;

		param:  tipo ID
					| tipo ID '=' exp
					| exp
					;

		invoc_funcion: ID  '(' lista_params ')'
							| ID  '(' ')'
							;




SecPpal:  /*cadena vacia*/
		;

tipo: ENTERO
		 |FLOAT
		;

exp: ID
   | INT
	 | FLOTANTE
	 | invoc_funcion
   | exp '+' exp
   | exp '-' exp
   | exp '*' exp
   | exp '/' exp  
   ;
%%
int yyerror(char *s) {
   printf("yyerror : %s\n",s);
   return 0;
}








