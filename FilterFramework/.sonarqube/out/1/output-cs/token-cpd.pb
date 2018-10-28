¤A
4D:\FilterFramework\Filter.Framework\FilterBuilder.cs
	namespace

 	
Filter


 
.

 
	Framework

 
{ 
public 

static 
class 
FilterBuilder %
{ 
public 
static 

Expression  
<  !
Func! %
<% &
T& '
,' (
bool) -
>- .
>. /"
CreateFilterExpression0 F
<F G
TG H
>H I
(I J
FilterDefinitionJ Z

filterdata[ e
)e f
{ 	
if 
( 

filterdata 
== 
null "
)" #
{ 
return 
null 
; 
} 
var 
metadata 
= #
FilterMetadataExtractor 2
.2 3
ExtractMetadata3 B
<B C
TC D
>D E
(E F
)F G
;G H
DoValidationProcess 
(  

filterdata  *
,* +
metadata, 4
)4 5
;5 6
var 
spec 
= 
CreateExpression '
<' (
T( )
>) *
(* +

filterdata+ 5
,5 6
metadata7 ?
)? @
;@ A
return 
spec 
. 
ToExpression $
($ %
)% &
;& '
} 	
private 
static 
void 
DoValidationProcess /
(/ 0
FilterDefinition0 @

filterdataA K
,K L
FilterMetadataL Z
metadata[ c
)c d
{ 	
List 
< "
SimpleFilterDefinition '
>' (
simpleFilters) 6
=7 8
new9 <
List= A
<A B"
SimpleFilterDefinitionB X
>X Y
(Y Z
)Z [
;[ \&
ExtractAllSimpleFilterData &
(& '

filterdata' 1
,1 2
ref3 6
simpleFilters7 D
)D E
;E F
foreach 
( 
var 
filter 
in  "
simpleFilters# 0
)0 1
{   
bool!! 
isValidField!! !
=!!" #
false!!$ )
;!!) *
foreach"" 
("" 
var"" 
item"" !
in""" $
metadata""% -
.""- .
Items"". 3
)""3 4
{## 
if$$ 
($$ 
filter$$ 
.$$ 
	FieldName$$ (
==$$) +
item$$, 0
.$$0 1
	FieldName$$1 :
)$$: ;
{%% 
try&& 
{'' 
Convert(( #
.((# $

ChangeType(($ .
(((. /
filter((/ 5
.((5 6
Value((6 ;
,((; <
item((= A
.((A B
Type((B F
)((F G
;((G H
isValidField)) (
=))) *
true))+ /
;))/ 0
}** 
catch++ 
{,, 
isValidField-- (
=--) *
false--+ 0
;--0 1
break.. !
;..! "
}00 
}11 
}22 
if33 
(33 
!33 
isValidField33 !
)33! "
{44 
throw55 
new55 %
InvalidOperationException55 7
(557 8
$"558 :0
$Invalid filter has been  applyed to 55: ^
{55^ _
metadata55_ g
.55g h
TypeName55h p
}55p q
	 Filter: 55q z
{55z {
filter	55{ 
}
55 ‚
"
55‚ ƒ
)
55ƒ „
;
55„ …
}66 
}77 
}88 	
private:: 
static:: 
void:: &
ExtractAllSimpleFilterData:: 6
(::6 7
FilterDefinition::7 G

filterdata::H R
,::R S
ref::T W
List::X \
<::\ ]"
SimpleFilterDefinition::] s
>::s t
result::u {
)::{ |
{;; 	
if<< 
(<< 

filterdata<< 
is<< "
SimpleFilterDefinition<< 4
)<<4 5
{== 
result>> 
.>> 
Add>> 
(>> 

filterdata>> %
as>>& ("
SimpleFilterDefinition>>) ?
)>>? @
;>>@ A
}?? 
else@@ 
if@@ 
(@@ 

filterdata@@ 
is@@  "#
ComplexFilterDefinition@@# :
)@@: ;
{AA 
varBB 
complexfilterDataBB %
=BB& '

filterdataBB( 2
asBB3 5#
ComplexFilterDefinitionBB6 M
;BBM N&
ExtractAllSimpleFilterDataCC *
(CC* +
complexfilterDataCC+ <
.CC< =

LeftFilterCC= G
,CCG H
refCCI L
resultCCM S
)CCS T
;CCT U&
ExtractAllSimpleFilterDataDD *
(DD* +
complexfilterDataDD+ <
.DD< =
RightFilterDD= H
,DDH I
refDDJ M
resultDDN T
)DDT U
;DDU V
}EE 
}GG 	
privateII 
staticII 
SpecificationII $
<II$ %
TII% &
>II& '
CreateExpressionII( 8
<II8 9
TII9 :
>II: ;
(II; <
FilterDefinitionII< L

filterdataIIM W
,IIW X
FilterMetadataIIY g
metadataIIh p
)IIp q
{JJ 	
SpecificationKK 
<KK 
TKK 
>KK 
specKK !
=KK" #
nullKK$ (
;KK( )
ifLL 
(LL 

filterdataLL 
isLL "
SimpleFilterDefinitionLL 4
)LL4 5
{MM 
varNN 
dataNN 
=NN 

filterdataNN %
asNN& ("
SimpleFilterDefinitionNN) ?
;NN? @
specOO 
=OO 
newOO 
FieldSpecificationOO -
<OO- .
TOO. /
>OO/ 0
(OO0 1
dataOO1 5
,OO5 6
metadataOO6 >
.OO> ?
GetTypeCodeOfFieldOO? Q
(OOQ R
dataOOR V
.OOV W
	FieldNameOOW `
)OO` a
)OOa b
;OOb c
}PP 
elseQQ 
ifQQ 
(QQ 

filterdataQQ 
isQQ  "#
ComplexFilterDefinitionQQ# :
)QQ: ;
{RR 
varSS 
dataSS 
=SS 

filterdataSS %
asSS& (#
ComplexFilterDefinitionSS) @
;SS@ A
ifTT 
(TT 
dataTT 
.TT 
FiltersConnectorTT )
==TT* ,#
ComplexFilterDefinitionTT- D
.TTD E
	ConnectorTTE N
.TTN O
AndTTO R
)TTR S
{UU 
specVV 
=VV 
newVV 
AndSpecificationVV /
<VV/ 0
TVV0 1
>VV1 2
(VV2 3
CreateExpressionVV3 C
<VVC D
TVVD E
>VVE F
(VVF G
dataVVG K
.VVK L

LeftFilterVVL V
,VVV W
metadataVVX `
)VV` a
,VVa b
CreateExpressionVVc s
<VVs t
TVVt u
>VVu v
(VVv w
dataVVw {
.VV{ |
RightFilter	VV| ‡
,
VV‡ ˆ
metadata
VV‰ ‘
)
VV‘ ’
)
VV’ “
;
VV“ ”
}WW 
elseXX 
{YY 
specZZ 
=ZZ 
newZZ 
OrSpecificationZZ .
<ZZ. /
TZZ/ 0
>ZZ0 1
(ZZ1 2
CreateExpressionZZ2 B
<ZZB C
TZZC D
>ZZD E
(ZZE F
dataZZF J
.ZZJ K

LeftFilterZZK U
,ZZU V
metadataZZW _
)ZZ_ `
,ZZ` a
CreateExpressionZZb r
<ZZr s
TZZs t
>ZZt u
(ZZu v
dataZZv z
.ZZz {
RightFilter	ZZ{ †
,
ZZ† ‡
metadata
ZZˆ 
)
ZZ ‘
)
ZZ‘ ’
;
ZZ’ “
}[[ 
}\\ 
return]] 
spec]] 
;]] 
}^^ 	
}__ 
}aa é
>D:\FilterFramework\Filter.Framework\Properties\AssemblyInfo.cs
[ 
assembly 	
:	 

AssemblyTitle 
( 
$str +
)+ ,
], -
[		 
assembly		 	
:			 

AssemblyDescription		 
(		 
$str		 !
)		! "
]		" #
[

 
assembly

 	
:

	 
!
AssemblyConfiguration

  
(

  !
$str

! #
)

# $
]

$ %
[ 
assembly 	
:	 

AssemblyCompany 
( 
$str 
) 
] 
[ 
assembly 	
:	 

AssemblyProduct 
( 
$str -
)- .
]. /
[ 
assembly 	
:	 

AssemblyCopyright 
( 
$str 0
)0 1
]1 2
[ 
assembly 	
:	 

AssemblyTrademark 
( 
$str 
)  
]  !
[ 
assembly 	
:	 

AssemblyCulture 
( 
$str 
) 
] 
[ 
assembly 	
:	 


ComVisible 
( 
false 
) 
] 
[ 
assembly 	
:	 

Guid 
( 
$str 6
)6 7
]7 8
[## 
assembly## 	
:##	 

AssemblyVersion## 
(## 
$str## $
)##$ %
]##% &
[$$ 
assembly$$ 	
:$$	 

AssemblyFileVersion$$ 
($$ 
$str$$ (
)$$( )
]$$) *¬
ED:\FilterFramework\Filter.Framework\Specification\AndSpecification.cs
	namespace		 	
Filter		
 
.		 
	Framework		 
.		 
Specification		 (
{

 
public 

sealed 
class 
AndSpecification (
<( )
T) *
>* +
:, -
Specification. ;
<; <
T< =
>= >
{ 
private 
readonly 
Specification &
<& '
T' (
>( )
left* .
;. /
private 
readonly 
Specification &
<& '
T' (
>( )
right* /
;/ 0
public 
AndSpecification 
(  
Specification  -
<- .
T. /
>/ 0
left1 5
,5 6
Specification7 D
<D E
TE F
>F G
rightH M
)M N
{ 	
this 
. 
right 
= 
right 
; 
this 
. 
left 
= 
left 
; 
} 	
public 
override 

Expression "
<" #
Func# '
<' (
T( )
,) *
bool+ /
>/ 0
>0 1
ToExpression2 >
(> ?
)? @
{ 	

Expression 
< 
Func 
< 
T 
, 
bool #
># $
>$ %
leftExpression& 4
=5 6
left7 ;
.; <
ToExpression< H
(H I
)I J
;J K

Expression 
< 
Func 
< 
T 
, 
bool #
># $
>$ %
rightExpression& 5
=6 7
right8 =
.= >
ToExpression> J
(J K
)K L
;L M
var 
	paramExpr 
= 

Expression &
.& '
	Parameter' 0
(0 1
typeof1 7
(7 8
T8 9
)9 :
): ;
;; <
var 
exprBody 
= 

Expression %
.% &
AndAlso& -
(- .
leftExpression. <
.< =
Body= A
,A B
rightExpressionC R
.R S
BodyS W
)W X
;X Y
exprBody   
=   
(   
BinaryExpression   (
)  ( )
new  ) ,
ParameterReplacer  - >
(  > ?
	paramExpr  ? H
)  H I
.  I J
Visit  J O
(  O P
exprBody  P X
)  X Y
;  Y Z
var!! 
	finalExpr!! 
=!! 

Expression!! &
.!!& '
Lambda!!' -
<!!- .
Func!!. 2
<!!2 3
T!!3 4
,!!4 5
bool!!6 :
>!!: ;
>!!; <
(!!< =
exprBody!!= E
,!!E F
	paramExpr!!G P
)!!P Q
;!!Q R
return## 
	finalExpr## 
;## 
}$$ 	
}%% 
}&& ü@
GD:\FilterFramework\Filter.Framework\Specification\FieldSpecification.cs
	namespace

 	
Filter


 
.

 
	Framework

 
.

 
Specification

 (
{ 
internal 
static 
class 
StringMethods '
{ 
public 
readonly 
static 

MethodInfo )
ContainsMethod* 8
=9 :
typeof; A
(A B
stringB H
)H I
.I J
	GetMethodJ S
(S T
$strT ^
,^ _
new` c
[c d
]d e
{f g
typeofh n
(n o
stringo u
)u v
}w x
)x y
;y z
public 
readonly 
static 

MethodInfo )
StartsWithMethod* :
=; <
typeof= C
(C D
stringD J
)J K
.K L
	GetMethodL U
(U V
$strV b
,b c
newd g
[g h
]h i
{j k
typeofl r
(r s
strings y
)y z
}{ |
)| }
;} ~
public 
readonly 
static 

MethodInfo )
EndsWithMethod* 8
=9 :
typeof; A
(A B
stringB H
)H I
.I J
	GetMethodJ S
(S T
$strT ^
,^ _
new` c
[c d
]d e
{f g
typeofh n
(n o
stringo u
)u v
}w x
)x y
;y z
} 
public 

sealed 
class 
FieldSpecification *
<* +
T+ ,
>, -
:. /
Specification0 =
<= >
T> ?
>? @
{ 
readonly "
SimpleFilterDefinition '
data( ,
;, -
readonly 
TypeCode 
typeCode "
;" #
public 
FieldSpecification !
(! ""
SimpleFilterDefinition" 8
data9 =
,= >
TypeCode> F
typeCodeG O
)O P
{ 	
this 
. 
data 
= 
data 
; 
this 
. 
typeCode 
= 
typeCode #
;# $
} 	
public 
override 

Expression "
<" #
Func# '
<' (
T( )
,) *
bool+ /
>/ 0
>0 1
ToExpression2 >
(> ?
)? @
{ 	
return 
	Translate 
( 
) 
; 
} 	
public$$ 

Expression$$ 
<$$ 
Func$$ 
<$$ 
T$$  
,$$  !
bool$$" &
>$$& '
>$$' (
	Translate$$) 2
($$2 3
)$$3 4
{%% 	
ParameterExpression&& 
param&&  %
=&&& '

Expression&&( 2
.&&2 3
	Parameter&&3 <
(&&< =
typeof&&= C
(&&C D
T&&D E
)&&E F
,&&F G
$str&&H N
)&&N O
;&&O P

Expression'' 
cmpExpression'' $
=''% &
null''' +
;''+ ,
MemberExpression(( 
member(( #
=(($ %

Expression((& 0
.((0 1
Property((1 9
(((9 :
param((: ?
,((? @
data((A E
.((E F
	FieldName((F O
)((O P
;((P Q
Type)) 
type)) 
=)) 
Type)) 
.)) 
GetType)) $
())$ %
$str))% .
+))/ 0
typeCode))1 9
)))9 :
;)): ;
ConstantExpression** 
constant** '
=**( )

Expression*** 4
.**4 5
Constant**5 =
(**= >
Convert**> E
.**E F

ChangeType**F P
(**P Q
data**Q U
.**U V
Value**V [
,**[ \
typeCode**] e
)**e f
,**f g
type**h l
)**l m
;**m n
switch-- 
(-- 
data-- 
.-- 
Operator-- !
)--! "
{.. 
case// 
ComparesionOperator// (
.//( )
Equals//) /
:/// 0
cmpExpression00 !
=00" #

Expression00$ .
.00. /
Equal00/ 4
(004 5
member005 ;
,00; <
constant00= E
)00E F
;00F G
break11 
;11 
case22 
ComparesionOperator22 (
.22( )
Contains22) 1
:221 2
cmpExpression33 !
=33" #

Expression33$ .
.33. /
Call33/ 3
(333 4
member334 :
,33: ;
StringMethods33< I
.33I J
ContainsMethod33J X
,33X Y
constant33Z b
)33b c
;33c d
break44 
;44 
case55 
ComparesionOperator55 (
.55( )
GreaterThan55) 4
:554 5
cmpExpression66 !
=66" #

Expression66$ .
.66. /
GreaterThan66/ :
(66: ;
member66; A
,66A B
constant66C K
)66K L
;66L M
break77 
;77 
case88 
ComparesionOperator88 (
.88( )
GreaterThanOrEqual88) ;
:88; <
cmpExpression99 !
=99" #

Expression99$ .
.99. /
GreaterThanOrEqual99/ A
(99A B
member99B H
,99H I
constant99J R
)99R S
;99S T
break:: 
;:: 
case;; 
ComparesionOperator;; (
.;;( )
LessThan;;) 1
:;;1 2
cmpExpression<< !
=<<" #

Expression<<$ .
.<<. /
LessThan<</ 7
(<<7 8
member<<8 >
,<<> ?
constant<<@ H
)<<H I
;<<I J
break== 
;== 
case>> 
ComparesionOperator>> (
.>>( )
LessThanOrEqualTo>>) :
:>>: ;
cmpExpression?? !
=??" #

Expression??$ .
.??. /
LessThanOrEqual??/ >
(??> ?
member??? E
,??E F
constant??G O
)??O P
;??P Q
break@@ 
;@@ 
caseAA 
ComparesionOperatorAA (
.AA( )

StartsWithAA) 3
:AA3 4
cmpExpressionBB !
=BB" #

ExpressionBB$ .
.BB. /
CallBB/ 3
(BB3 4
memberBB4 :
,BB: ;
StringMethodsBB< I
.BBI J
StartsWithMethodBBJ Z
,BBZ [
constantBB\ d
)BBd e
;BBe f
breakCC 
;CC 
caseDD 
ComparesionOperatorDD (
.DD( )
EndsWithDD) 1
:DD1 2
cmpExpressionEE !
=EE" #

ExpressionEE$ .
.EE. /
CallEE/ 3
(EE3 4
memberEE4 :
,EE: ;
StringMethodsEE< I
.EEI J
EndsWithMethodEEJ X
,EEX Y
constantEEZ b
)EEb c
;EEc d
breakFF 
;FF 
}GG 

ExpressionHH 
<HH 
FuncHH 
<HH 
THH 
,HH 
boolHH #
>HH# $
>HH$ %
resultHH& ,
=HH- .
nullHH/ 3
;HH3 4
ifII 
(II 
cmpExpressionII 
!=II  
nullII! %
)II% &
{JJ 
resultKK 
=KK 

ExpressionKK #
.KK# $
LambdaKK$ *
<KK* +
FuncKK+ /
<KK/ 0
TKK0 1
,KK1 2
boolKK3 7
>KK7 8
>KK8 9
(KK9 :
cmpExpressionKK: G
,KKG H
paramKKI N
)KKN O
;KKO P
}LL 
returnMM 
resultMM 
;MM 
}NN 	
}OO 
}PP ž
DD:\FilterFramework\Filter.Framework\Specification\OrSpecification.cs
	namespace 	
Filter
 
. 
	Framework 
. 
Specification (
{		 
public 

sealed 
class 
OrSpecification '
<' (
T( )
>) *
:+ ,
Specification- :
<: ;
T; <
>< =
{ 
private 
readonly 
Specification &
<& '
T' (
>( )
left* .
;. /
private 
readonly 
Specification &
<& '
T' (
>( )
right* /
;/ 0
public 
OrSpecification 
( 
Specification ,
<, -
T- .
>. /
left0 4
,4 5
Specification6 C
<C D
TD E
>E F
rightG L
)L M
{ 	
this 
. 
right 
= 
right 
; 
this 
. 
left 
= 
left 
; 
} 	
public 
override 

Expression "
<" #
Func# '
<' (
T( )
,) *
bool+ /
>/ 0
>0 1
ToExpression2 >
(> ?
)? @
{ 	
var 
leftExpression 
=  
left! %
.% &
ToExpression& 2
(2 3
)3 4
;4 5
var 
rightExpression 
=  !
right" '
.' (
ToExpression( 4
(4 5
)5 6
;6 7
var 
	paramExpr 
= 

Expression &
.& '
	Parameter' 0
(0 1
typeof1 7
(7 8
T8 9
)9 :
): ;
;; <
var 
exprBody 
= 

Expression %
.% &
OrElse& ,
(, -
leftExpression- ;
.; <
Body< @
,@ A
rightExpressionB Q
.Q R
BodyR V
)V W
;W X
exprBody 
= 
( 
BinaryExpression (
)( )
new) ,
ParameterReplacer- >
(> ?
	paramExpr? H
)H I
.I J
VisitJ O
(O P
exprBodyP X
)X Y
;Y Z
var 
	finalExpr 
= 

Expression &
.& '
Lambda' -
<- .
Func. 2
<2 3
T3 4
,4 5
bool6 :
>: ;
>; <
(< =
exprBody= E
,E F
	paramExprG P
)P Q
;Q R
return!! 
	finalExpr!! 
;!! 
}"" 	
}## 
}$$ º
FD:\FilterFramework\Filter.Framework\Specification\ParameterReplacer.cs
	namespace 	
Filter
 
. 
	Framework 
. 
Specification (
{		 
internal

 
class

 
ParameterReplacer

 $
:

% &
ExpressionVisitor

' 8
{ 
private 
readonly 
ParameterExpression ,
	parameter- 6
;6 7
	protected 
override 

Expression %
VisitParameter& 4
(4 5
ParameterExpression5 H
nodeI M
)M N
=>O Q
baseR V
.V W
VisitParameterW e
(e f
	parameterf o
)o p
;p q
internal 
ParameterReplacer "
(" #
ParameterExpression# 6
	parameter7 @
)@ A
{ 	
this 
. 
	parameter 
= 
	parameter &
;& '
} 	
} 
} É
BD:\FilterFramework\Filter.Framework\Specification\Specification.cs
	namespace 	
Filter
 
. 
	Framework 
. 
Specification (
{ 
public		 

abstract		 
class		 
Specification		 '
<		' (
T		( )
>		) *
{

 
public 
abstract 

Expression "
<" #
Func# '
<' (
T( )
,) *
bool+ /
>/ 0
>0 1
ToExpression2 >
(> ?
)? @
;@ A
public 
Specification 
< 
T 
> 
And  #
(# $
Specification$ 1
<1 2
T2 3
>3 4
specification5 B
)B C
{ 	
return 
new 
AndSpecification '
<' (
T( )
>) *
(* +
this+ /
,/ 0
specification1 >
)> ?
;? @
} 	
public 
Specification 
< 
T 
> 
Or  "
(" #
Specification# 0
<0 1
T1 2
>2 3
specification4 A
)A B
{ 	
return 
new 
OrSpecification &
<& '
T' (
>( )
() *
this* .
,. /
specification0 =
)= >
;> ?
} 	
} 
} 