�
=D:\FilterFramework\Filter.Metadata\ComplexFilterDefinition.cs
	namespace 	
Filter
 
. 
Metadata 
{ 
public		 

sealed		 
class		 #
ComplexFilterDefinition		 /
:		0 1
FilterDefinition		2 B
{

 
private #
ComplexFilterDefinition '
(' (
)( )
{ 	
} 	
internal 
static 
FilterDefinition (
And) ,
(, -
FilterDefinition- =
left> B
,B C
FilterDefinitionD T
rightU Z
)Z [
{ 	
return 
new #
ComplexFilterDefinition .
{/ 0
RightFilter1 <
== >
right? D
,D E

LeftFilterF P
=Q R
leftS W
,W X
FiltersConnectorY i
=j k
	Connectorl u
.u v
Andv y
}z {
;{ |
} 	
internal 
static 
FilterDefinition (
Or) +
(+ ,
FilterDefinition, <
left= A
,A B
FilterDefinitionC S
rightT Y
)Y Z
{ 	
return 
new #
ComplexFilterDefinition .
{/ 0
RightFilter1 <
== >
right? D
,D E

LeftFilterF P
=Q R
leftS W
,W X
FiltersConnectorY i
=j k
	Connectorl u
.u v
Orv x
}y z
;z {
} 	
public 
FilterDefinition 
RightFilter  +
{, -
get. 1
;1 2
private3 :
set; >
;> ?
}@ A
public 
FilterDefinition 

LeftFilter  *
{+ ,
get- 0
;0 1
private2 9
set: =
;= >
}? @
public 
	Connector 
FiltersConnector )
{* +
get, /
;/ 0
private1 8
set9 <
;< =
}> ?
public 
enum 
	Connector 
{ 	
And 
, 
Or 
} 	
public   
override   
string   
ToString   '
(  ' (
)  ( )
{!! 	
return"" 
$""" 
( "" 
{"" 

LeftFilter"" "
}""" #
{""$ %
FiltersConnector""% 5
}""5 6
{""7 8
RightFilter""8 C
}""C D
 )""D F
"""F G
;""G H
}## 	
}$$ 
}%% �%
=D:\FilterFramework\Filter.Metadata\FilterMetadataExtractor.cs
	namespace		 	
Filter		
 
.		 
Metadata		 
{

 
public 

static 
class #
FilterMetadataExtractor /
{ 
static
ConcurrentDictionary
<
string
,
FilterMetadata
>

=
new
ConcurrentDictionary
<
string
,
FilterMetadata
>
(
)
;
public 
static 
FilterMetadata $
ExtractMetadata% 4
<4 5
T5 6
>6 7
(7 8
)8 9
{ 	
FilterMetadata 
metadata #
=$ %
null& *
;* +
var 
typeName 
= 
typeof !
(! "
T" #
)# $
.$ %
FullName% -
;- .
if 
( 

. 
ContainsKey )
() *
typeName* 2
)2 3
)3 4
{ 
metadata 
= 

[( )
typeName) 1
]1 2
;2 3
} 
else 
{ 
metadata 
= 
DoExtractProcess +
(+ ,
typeof, 2
(2 3
T3 4
)4 5
)5 6
;6 7

. 
TryAdd $
($ %
typeName% -
,- .
metadata/ 7
)7 8
;8 9
} 
return 
metadata 
; 
} 	
private 
static 
FilterMetadata %
DoExtractProcess& 6
(6 7
Type7 ;
type< @
)@ A
{ 	
List   
<   
FilterItemMetadata   #
>  # $
items  % *
=  + ,
new  - 0
List  1 5
<  5 6
FilterItemMetadata  6 H
>  H I
(  I J
)  J K
;  K L
var!! 

properties!! 
=!! 
type!! !
.!!! "

(!!/ 0
)!!0 1
;!!1 2
foreach"" 
("" 
var"" 
prop"" 
in""  

properties""! +
)""+ ,
{## 
var$$ 
	attribute$$ 
=$$ 
prop$$  $
.$$$ %
GetCustomAttributes$$% 8
($$8 9
typeof$$9 ?
($$? @'
FilterParticipatedAttribute$$@ [
)$$[ \
,$$\ ]
false$$^ c
)$$c d
;$$d e
if%% 
(%% 
	attribute%% 
.%% 
Length%% $
>%%$ %
$num%%% &
)%%& '
{&& 
FilterItemMetadata'' &

searchItem''' 1
=''2 3
new''4 7
FilterItemMetadata''8 J
(''J K
)''K L
;''L M

searchItem(( 
.(( 
	FieldName(( (
=(() *
prop((+ /
.((/ 0
Name((0 4
;((4 5

searchItem)) 
.)) 
Type)) #
=))$ %
Type))& *
.))* +
GetTypeCode))+ 6
())6 7
prop))7 ;
.)); <
PropertyType))< H
)))H I
;))I J

searchItem** 
.** 
Title** $
=**% &
(**' (
	attribute**( 1
[**1 2
$num**2 3
]**3 4
as**5 7'
FilterParticipatedAttribute**8 S
)**S T
.**T U
Title**U Z
;**Z [
items++ 
.++ 
Add++ 
(++ 

searchItem++ (
)++( )
;++) *
},, 
}-- 
FilterMetadata.. 
metadta.. "
=..# $
null..% )
;..) *
if// 
(// 
items// 
.// 
Any// 
(// 
)// 
)// 
{00 
metadta11 
=11 
new11 
FilterMetadata11 ,
(11, -
)11- .
;11. /
metadta22 
.22 
TypeName22  
=22! "
type22# '
.22' (
FullName22( 0
;220 1
metadta33 
.33 
Items33 
=33 
items33  %
;33% &
}44 
return55 
metadta55 
;55 
}66 	
}77 
}88 �
AD:\FilterFramework\Filter.Metadata\FilterParticipatedAttribute.cs
	namespace 	
Filter
 
. 
Metadata 
{		 
[

 
AttributeUsage

 
(

 
AttributeTargets

 $
.

$ %
Property

% -
,

- .
	Inherited

/ 8
=

9 :
false

; @
,

@ A


B O
=

P Q
false

R W
)

W X
]

X Y
public 

sealed 
class '
FilterParticipatedAttribute 3
:4 5
	Attribute6 ?
{ 
public
FilterParticipatedAttribute
(
string
title
)
{ 	
this 
. 
Title 
= 
title 
; 
} 	
public 
string 
Title 
{ 
get !
;! "
private# *
set+ .
;. /
}0 1
} 
} �
6D:\FilterFramework\Filter.Metadata\FilterDefinition.cs
	namespace 	
Filter
 
. 
Metadata 
{ 
public		 

abstract		 
class		 
FilterDefinition		 *
{

 
	protected 
FilterDefinition "
(" #
)# $
{ 	
} 	
public 
FilterDefinition 
And  #
(# $
FilterDefinition$ 4
right5 :
): ;
{ 	
return #
ComplexFilterDefinition *
.* +
And+ .
(. /
this/ 3
,3 4
right5 :
): ;
;; <
} 	
public 
FilterDefinition 
Or  "
(" #
FilterDefinition# 3
right4 9
)9 :
{ 	
return #
ComplexFilterDefinition *
.* +
Or+ -
(- .
this. 2
,2 3
right4 9
)9 :
;: ;
} 	
} 
} �
4D:\FilterFramework\Filter.Metadata\FilterMetadata.cs
	namespace 	
Filter
 
. 
Metadata 
{ 
public		 

sealed		 
class		 
FilterMetadata		 &
{

 
public 
string 
TypeName 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
List 
< 
FilterItemMetadata &
>& '
Items( -
{. /
get0 3
;3 4
set5 8
;8 9
}: ;
public
TypeCode
GetTypeCodeOfField
(
string
	fieldName
)
{ 	
TypeCode 
resule 
= 
TypeCode &
.& '
Empty' ,
;, -
var 
item 
= 
Items 
. 
FirstOrDefault +
(+ ,
x, -
=>. 0
x1 2
.2 3
	FieldName3 <
=== ?
	fieldName@ I
)I J
;J K
if 
( 
item 
!= 
null 
) 
{ 
resule 
= 
item 
. 
Type "
;" #
} 
return 
resule 
; 
} 	
} 
public 

class 
FilterItemMetadata #
{ 
public 
string 
Title 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
	FieldName 
{  !
get" %
;% &
set' *
;* +
}, -
public 
TypeCode 
Type 
{ 
get "
;" #
set$ '
;' (
}) *
} 
}   �
9D:\FilterFramework\Filter.Metadata\ComparesionOperator.cs
	namespace 	
Filter
 
. 
Metadata 
{ 
public		 

enum		 
ComparesionOperator		 #
{

 
Contains 
, 
GreaterThan 
, 
GreaterThanOrEqual
,
LessThan 
, 
LessThanOrEqualTo 
, 

StartsWith 
, 
EndsWith 
, 
Equals 
, 
NotEqual 
} 
} �
=D:\FilterFramework\Filter.Metadata\Properties\AssemblyInfo.cs
[ 
assembly 	
:	 


( 
$str *
)* +
]+ ,
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
$str ,
), -
]- .
[
assembly
:

AssemblyCopyright
(
$str
)
]
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
]$$) *�
6D:\FilterFramework\Filter.Metadata\SimpleFilterData.cs
	namespace 	
Filter
 
. 
Metadata 
{ 
public		 

sealed		 
class		 "
SimpleFilterDefinition		 .
:		/ 0
FilterDefinition		1 A
{

 
public "
SimpleFilterDefinition %
(% &
string& ,
	fieldName- 6
,6 7
string8 >
value? D
,D E
ComparesionOperatorF Y
	@operatorZ c
)c d
{ 	
this
.
	FieldName
=
	fieldName
;
this 
. 
Value 
= 
value 
; 
this 
. 
Operator 
= 
	@operator %
;% &
} 	
public 
string 
	FieldName 
{  !
get" %
;% &
private' .
set/ 2
;2 3
}4 5
public 
string 
Value 
{ 
get !
;! "
private# *
set+ .
;. /
}0 1
public 
ComparesionOperator "
Operator# +
{, -
get. 1
;1 2
private3 :
set; >
;> ?
}@ A
public 
override 
string 
ToString '
(' (
)( )
{ 	
return 
$" 
{ 
	FieldName 
}  
{! "
Operator" *
}* +
{, -
Value- 2
}2 3
"3 4
;4 5
} 	
} 
} 