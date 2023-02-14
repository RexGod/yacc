
%option nodefault
%option noyywrap

%{
#include "bisn.tab.h"
%}

LineTerminator \n|\r\n
Token {Identifier}|{Literal}|{Separator}|{Operator}
NoToken {Comment}|{WhiteSpace}
Identifier {IdentifierStartWith}{IdentifierRest}*
IdentifierStartWith [A-Za-z]
IdentifierRest {IdentifierStartWith}|[0-9]|_
WhiteSpace [\t ]|{LineTerminator}
Separator [;.!?{},:()[\]]|"::"|"!."|"?.'"
Operator [=+*/<>!%$&-]|"<="|">="|"+="|"-="|"/="|"*="|"=="|"&&"|"||"|"|"
Keyword {AbstractKeyword}|{ElseKeyword}|{ImportKeyword}|{SuperKeyword}|{AsKeyword}|{EnumKeyword}|{InKeyword}|{SwitchKeyword}|{CaseKeyword}|{IfKeyword}|{SyncKeyword}|{NewKeyword}|{ExtentionKeyword}|{ExtentionKeyword}|{AsyncKeyword}|{ThrowKeyword}|{TrueKeyword}|{FalseKeyword}|{ClassKeyword}|{TryKeyword}|{ExtendsKeyword}|{FinalKeyword}|{CatchKeyword}|{VoidKeyword}|{VarKeyword}|{ConstKeyword}|{WhileKeyword}|{ForKeyword}|{RethrowKeyword}|{ContinueKeyword}|{FunctionKeyword}|{NullKeyword}|{ReturnKeyword}|{GetKeyword}|{SetKeyword}|{DoKeyword}|{StaticKeyword}|{ImplementsKeyword}|{DynamicKeyword}|{AwaitKeyword}|{WithKeyword}|{IntKeyword}|{DoubleKeyword}|{StringKeyword}

AbstractKeyword abstract
ElseKeyword else
ImportKeyword import
SuperKeyword super
AsKeyword as
EnumKeyword enum
InKeyword in
SwitchKeyword switch
CaseKeyword case
IfKeyword if
SyncKeyword sync
NewKeyword new
ExtentionKeyword extention
AsyncKeyword async
ThrowKeyword throw
TrueKeyword true
FalseKeyword false
ClassKeyword class
TryKeyword try
ExtendsKeyword extends
FinalKeyword final
CatchKeyword catch
VoidKeyword void
VarKeyword var
ConstKeyword const
WhileKeyword while
ForKeyword for
RethrowKeyword rethrow
ContinueKeyword continue
FunctionKeyword Function
NullKeyword null
ReturnKeyword return
GetKeyword get
SetKeyword set
DoKeyword do
StaticKeyword static
ImplementsKeyword  implements
DynamicKeyword dynamic
AwaitKeyword await
WithKeyword with
IntKeyword int
DoubleKeyword double
StringKeyword String

Literal {Digit}|{Floatingpoint}|{FalseKeyword}|{TrueKeyword}|{NullKeyword}
Digit [0-9]*
Anything [^\n]
Floatingpoint ({Digit}*\.{Digit}*)
Comment "//"{Anything}*|"/*"{Anything}|{LineTerminator}"*/"


CharValues \'{Anything}\'

StringValue {StringValues}|{TextBlock}

StringValues \"([ \t\f]|{Anything})*\"|{TextBlock}
TextBlock \"\"\"{WhiteSpace}*({Anything}|{LineTerminator})*\"\"\"


EqualOperator "=="
NotEqualOperator "!="
GreaterThanOrEqualOperator ">="
LessThanOrEqualOperator "<="
AdditionAssignmentOperator "+="
MinusAssignmentOperator "-="
MultiplicationAssignmentOperator "*="
DivisionAssignmentOperator "/="
DecrementOperator "--"
IncrementOperator "++"

%%
{AbstractKeyword} { return AbstractKeyword;}
{StringKeyword} { return StringKeyword;}
{IntKeyword} { return IntKeyword;}
{DoubleKeyword} { return DoubleKeyword;}
{ImportKeyword} { return ImportKeyword;}
{SuperKeyword} { return SuperKeyword;}
{AsKeyword} { return AsKeyword;}
{InKeyword} { return InKeyword;}
{NewKeyword} { return NewKeyword;}
{ExtentionKeyword} { return ExtentionKeyword;}
{IfKeyword} { return IfKeyword;}
{ThrowKeyword} { return ThrowKeyword;}
{RethrowKeyword} { return RethrowKeyword;}
{ClassKeyword} { return ClassKeyword;}
{ElseKeyword} { return ElseKeyword;}
{VoidKeyword} { return VoidKeyword;}
{ForKeyword} { return ForKeyword; }
{StaticKeyword} { return StaticKeyword;}
{ReturnKeyword} { return ReturnKeyword;}
{SwitchKeyword} { return SwitchKeyword;}
{CaseKeyword} { return CaseKeyword;}
{TryKeyword} { return TryKeyword;}
{SetKeyword} { return SetKeyword;}
{GetKeyword} { return GetKeyword;}
{FunctionKeyword} { return FunctionKeyword;}
{DoKeyword} { return DoKeyword;}
{ConstKeyword} { return ConstKeyword;}
{SyncKeyword} { return SyncKeyword; }
{VarKeyword} { return VarKeyword;  }
{EnumKeyword} { return EnumKeyword; }
{ContinueKeyword} { return ContinueKeyword; }
{AsyncKeyword} { return AsyncKeyword; }
{AwaitKeyword} { return AwaitKeyword; }
{WhileKeyword} { return WhileKeyword; }
{DynamicKeyword} { return DynamicKeyword; }
{EqualOperator} { return EqualOperator; }
{WithKeyword} { return WithKeyword;}
{CatchKeyword} { return CatchKeyword;}
{ImplementsKeyword} { return ImplementsKeyword;}
{ExtendsKeyword} { return ExtendsKeyword;}
{NullKeyword} { return NullKeyword; }
{TrueKeyword} { return TrueKeyword; }
{FalseKeyword} { return FalseKeyword;}
{Identifier} { return Identifier;}
{NotEqualOperator} { return NotEqualOperator; }
{GreaterThanOrEqualOperator} { return GreaterThanOrEqualOperator; }
{LessThanOrEqualOperator} { return LessThanOrEqualOperator; }
{AdditionAssignmentOperator} { return AdditionAssignmentOperator; }
{MinusAssignmentOperator} { return MinusAssignmentOperator; }
{MultiplicationAssignmentOperator} { return MultiplicationAssignmentOperator; }
{DivisionAssignmentOperator} { return DivisionAssignmentOperator; }
{DecrementOperator} { return DecrementOperator; }
{IncrementOperator} { return IncrementOperator; }
{Digit} { return Digit; }
{Floatingpoint} { return Floatingpoint; }
{CharValues} { return CharValues; }
{StringValue} { return StringKeyword; }
{NoToken} { }
(.) { return yytext[0]; }
%%
