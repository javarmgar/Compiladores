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
%token DEFINE
%token REGRESA


%left ';'
%left '+' '-'
%left '*' '/'
%left  OR
%left  AND

%left  ')'
%left  '}'
%left  OTRO

%start programa
%%

programa: lista_declVars lista_declFuncion SecPpal
					| lista_declFuncion SecPpal
					| lista_declVars
				;

SecPpal: lista_sentencias
			;
lista_declVars: variable';'
			| variable';'lista_declVars
    ;

variable: tipo ID
			| tipo ID '=' exp
			;
lista_declFuncion:declFuncion 
			| declFuncion lista_declFuncion
		;


declFuncion: proto_funcion '{'lista_sentencias'}'
			;


		 lista_sentencias: sentencia
						| sentencia lista_sentencias		
					;

		sentencia: variable';'
				| ID '=' exp';'
				| REGRESA exp';'
				| estructura
				| desplegar';'
				;

desplegar: DESPLIEGA '(' STRING ')'
				| DESPLIEGA '(' exp ')'  
			;

estructura: condicionalSI
					|mientras
				;


condicionalSI: SI '('list_exp_logica')'  sentencia OTRO sentencia
				| SI '('list_exp_logica')' '{'lista_sentencias '}' OTRO  '{'lista_sentencias '}' 	
				| SI '('list_exp_logica')'  sentencia 
				| SI '('list_exp_logica')' '{'lista_sentencias '}' 
				;


mientras: MIENTRAS'('list_exp_logica')' '{' '}'
				| MIENTRAS'('list_exp_logica')' '{' lista_sentencias'}'
				| MIENTRAS'('list_exp_logica')' sentencia
				;
			
list_exp_logica: op_unario exp_logica
							| op_unario exp_logica op_log_bin list_exp_logica
						;
	
exp_logica: exp op_comp exp
					;

op_comp: MYIGUAL
			| MRIGUAL
			| IGUAL
			| DIFER
			;
op_log_bin:AND
		|OR
		;

op_unario:
		|NOT
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






