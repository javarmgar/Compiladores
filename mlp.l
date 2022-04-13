%{
#include <string.h>
#include "util.h"
#include "y.tab.h"
#include "errormsg.h"

int charPos=1;

extern YYSTYPE yylval;

int yywrap(void)
{
 charPos=1;
 return 1;
}


void adjust(void)
{
 EM_tokPos=charPos;
 charPos+=yyleng;
}

//char bufer[256];char *apbufer;

#define MAX_STR_CONST   256
char string_buf[MAX_STR_CONST];
char *string_buf_ptr;
int string_tam;
%}


%x comentario
%x str

DIGITO   [0-9]
Ex        [eE][+-]?{DIGITO}+
S        [+-]

%%
" "      {adjust(); continue;}
"\t"      {adjust(); continue;}
\n       {adjust(); EM_newline(); continue;}
","      {adjust(); return ',';}
";"      {adjust(); return ';';}
"="      {adjust(); return '=';}
"("      {adjust(); return '(';}
")"      {adjust(); return ')';}
"{"      {adjust(); return '{';}
"}"      {adjust(); return '}';}
"+"      {adjust(); return '+';}
"-"      {adjust(); return '-';}
"*"      {adjust(); return '*';}
"%"      {adjust(); return '%';}
">"      {adjust(); return '>';}
":"      {adjust(); return ':';}
"<"      {adjust(); return '<';}
"&&"     {adjust(); return AND;}
"||"     {adjust(); return OR;}
"<="     {adjust(); return MRIGUAL;}
">="     {adjust(); return MYIGUAL;}
"!"      {adjust(); return NOT;}
"<>"     {adjust(); return DIFER;}
"=="     {adjust(); return IGUAL;}

mientras   {adjust(); return MIENTRAS;}
entero     {adjust(); return ENTERO;}
despliega  {adjust(); return DESPLIEGA;}
si         {adjust(); return SI;}
otro       {adjust(); return OTRO;}
flotante   {adjust(); return FLOAT;}
regresa    {adjust(); return REGRESA;}
define     {adjust(); return DEFINE;}


[a-zA-Z_][a-zA-Z0-9_]* {adjust(); yylval.sval=String(yytext); return ID;}
{DIGITO}+              {adjust(); yylval.ival = atoi( yytext ); return INT;}
{S}?{DIGITO}+"."{DIGITO}*{Ex}? |
{S}?{DIGITO}*"."{Ex}?{DIGITO}+{Ex}? |
{S}?{DIGITO}+{Ex}              {adjust(); yylval.fval = atof( yytext ); return FLOTANTE;}

\"	   {string_buf_ptr = string_buf; BEGIN(str); string_tam=0;}

	   <str>\" { /* saw closing quote - all done */
		BEGIN(INITIAL);
		*string_buf_ptr = '\0';
		yylval.sval=String(string_buf_ptr-string_tam);
		string_tam=0;
		return STRING;
		   /* return string constant token type and
		    * value to parser
		    */
		
		   }

	   <str>\n	  {
		   /* error - unterminated string constant */
		   /* generate error message */
			EM_error(EM_tokPos,"error - unterminated string constant");
			exit(0);
		   }

	   <str>\\[0-7]{1,3} {
		   /* octal escape sequence */
		   int result;

		   (void) sscanf( yytext + 1, "%o", &result );

		   if ( result > 0xff )
			   /* error, constant is out-of-bounds */

		   *string_buf_ptr++ = result;
		   ++string_tam;
		   }

	   <str>\\[0-9]+ {
		   /* generate error - bad escape sequence; something
		    * like '\48' or '\0777777'
		    */
			EM_error(EM_tokPos,"error - bad escape sequence");
			exit(0);
		   }

	   <str>\\n  {*string_buf_ptr++ = '\n'; ++string_tam;}
	   <str>\\t  {*string_buf_ptr++ = '\t'; }
	   <str>\\r  {*string_buf_ptr++ = '\r'; }
	   <str>\\b  {*string_buf_ptr++ = '\b'; }
	   <str>\\f  {*string_buf_ptr++ = '\f'; }

	   <str>\\(.|\n)  {*string_buf_ptr++ = yytext[1]; ++string_tam;}

	   <str>[^\\\n\"]+	{
		   char *yptr = yytext;
		   while ( *yptr ){*string_buf_ptr++ = *yptr++; ++string_tam;}
		}

		
"---""-"*      {adjust(); BEGIN(comentario);}
<comentario>[^-\n]*    {adjust();   /* come todo lo que no sea '-' */ }
<comentario>"-"|"--"   {adjust();}  /* come '-' ó '--' */ 
<comentario>\n         {adjust();EM_newline();}
<comentario>"-"+       {adjust(); BEGIN(INITIAL);}




  /*<<EOF>> {printf("\nFin de Archivo encontrado."); exit(0); }*/
.        {adjust(); EM_error(EM_tokPos,"token ilegal");}
