/* A Bison parser, made by GNU Bison 3.0.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2013 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    ID = 258,
    STRING = 259,
    INT = 260,
    DESPLIEGA = 261,
    SI = 262,
    OTRO = 263,
    AND = 264,
    OR = 265,
    NOT = 266,
    DIFER = 267,
    IGUAL = 268,
    ENTERO = 269,
    MIENTRAS = 270,
    FLOTANTE = 271,
    MYIGUAL = 272,
    MRIGUAL = 273,
    FLOAT = 274,
    DEFINE = 275,
    REGRESA = 276
  };
#endif
/* Tokens.  */
#define ID 258
#define STRING 259
#define INT 260
#define DESPLIEGA 261
#define SI 262
#define OTRO 263
#define AND 264
#define OR 265
#define NOT 266
#define DIFER 267
#define IGUAL 268
#define ENTERO 269
#define MIENTRAS 270
#define FLOTANTE 271
#define MYIGUAL 272
#define MRIGUAL 273
#define FLOAT 274
#define DEFINE 275
#define REGRESA 276

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE YYSTYPE;
union YYSTYPE
{
#line 5 "parser.y" /* yacc.c:1909  */
		
		int pos;
   	int ival;
   	float fval;
    char* sval;

#line 103 "y.tab.h" /* yacc.c:1909  */
};
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
