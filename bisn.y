%{
        #include <stdio.h>
        #include "lex.yy.c"

        int yylex();
        void yyerror(const char*);
%}

%token StringKeyword "String"
%token IntKeyword "int"
%token DoubleKeyword "double"
%token AbstractKeyword "abstarct"
%token ElseKeyword "else"
%token ImportKeyword "import"
%token SuperKeyword "super"
%token AsKeyword "as"
%token EnumKeyword "enum"
%token InKeyword "in"
%token SwitchKeyword "switch"
%token CaseKeyword "case"
%token IfKeyword "if"
%token SyncKeyword "sync"
%token NewKeyword "new"
%token ExtentionKeyword "extention"
%token AsyncKeyword "async"
%token ThrowKeyword "throw"
%token TrueKeyword "true"
%token FalseKeyword "false"
%token ClassKeyword "class"
%token TryKeyword "try"
%token ExtendsKeyword "extends"
%token FinalKeyword "final"
%token CatchKeyword "catch"
%token VoidKeyword "void"
%token VarKeyword "var"
%token ConstKeyword "const"
%token WhileKeyword "while"
%token ForKeyword "for"
%token RethrowKeyword "rethrow"
%token ContinueKeyword "continue"
%token FunctionKeyword "function"
%token NullKeyword "null"
%token ReturnKeyword "return"
%token GetKeyword "get"
%token SetKeyword "set"
%token DoKeyword "do"
%token StaticKeyword "static"
%token ImplementsKeyword  "implement"
%token DynamicKeyword "dynamic"
%token AwaitKeyword "await"
%token WithKeyword "with"

%token Identifier 
%token Literal

%token Floatingpoint "doubleVal"
%token Digit  "digitVal"
%token CharValues  "charVal"
%token StringValue "StringVal"

%token EqualOperator "=="
%token NotEqualOperator "!="
%token GreaterThanOrEqualOperator ">="
%token LessThanOrEqualOperator "<="
%token AdditionAssignmentOperator "+="
%token MinusAssignmentOperator "-="
%token MultiplicationAssignmentOperator "*="
%token DivisionAssignmentOperator "/="
%token DecrementOperator "--"
%token IncrementOperator "++"

%define parse.error detailed
%define parse.lac full
%%

Start:
     Imports MainMethod;

Imports:
       ImportStates
       ;

ImportStates:
	    ImportStates ImportState
	    | %empty
	    ; 

ImportState:
	   "import"  Identifier  ';'
	   ;
MainMethod:
	  "void" Identifier '(' ')' '{' Body '}';
Body:
    Statements;

Statements:
	  Statements Statement
	  | %empty;
Statement:
	 ForState
	|WhileState
	|Assignment
	|VaribleInit
	|IfState
	;
IfState:
       IfCondition
	|ElseCondition
	;
VaribleInit:
	   StringVar
	   |Intvar
	   |Boolean
	   |FloatVar
	   ;
Intvar:
      "int" AssignForInt;
Boolean:
       "boolean" AssignForInt;
FloatVar:
	"double" AssignForInt;
StringVar:
	 "String" AssignForInt;
Assignment:
	  AssignForInt
	  ;
AssignForInt:
	    Identifier '=' Opt ';';
ForState:
	"for" '(' "int" Identifier '='  "digitVal" ';' Opt ';' Identifier ForIncDec ')' '{' Body '}';
ForIncDec:
	 "++"	
	|"--"
	;

WhileState:
	  "while" '(' Opt ')' '{' Body '}';

IfCondition:
	   "if" '(' Opt ')' '{' Body '}';
ElseCondition:
	     "else" '{' Body '}';
Opt:
   LevelFiveExpression
          ;

LevelFiveExpression:
                   LevelFourExpression
                  |LevelFiveExpression "==" LevelFourExpression
                  |LevelFiveExpression "!=" LevelFourExpression
                  ;

LevelFourExpression:
                   LevelThreeExpression
                  |LevelFourExpression '>' LevelThreeExpression
                  |LevelFourExpression '<' LevelThreeExpression
                  |LevelFourExpression ">=" LevelThreeExpression
                  |LevelFourExpression "<=" LevelThreeExpression
                  ;

LevelThreeExpression:
                    LevelTwoExpression
                   |LevelThreeExpression '+' LevelTwoExpression
                   |LevelThreeExpression '-' LevelTwoExpression
                   ;

LevelTwoExpression:
                  LevelOneExpression
                 |LevelTwoExpression '*' LevelOneExpression
                 |LevelTwoExpression '/' LevelOneExpression
                 |LevelTwoExpression '%' LevelOneExpression
		 ;
LevelOneExpression:
                  "digitVal"
                 |"doubleVal"
                 | Identifier
                 | '('Opt ')'
                 ;
%%
void yyerror(const char*  s) {
       fprintf(stderr,"%s\n", s);
}

int main () {
	return yyparse();
}


