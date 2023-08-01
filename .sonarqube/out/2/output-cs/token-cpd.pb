ÍT
|/Users/abdulhadi.elhussain/Projects/AbdulhadiNagarroAssignment/AbdulhadiNagarroAssignment/Controllers/StatementController.cs
	namespace 	&
AbdulhadiNagarroAssignment
 $
.$ %
Controllers% 0
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
[ 
	Authorize 
] 
public 

class 
StatementController $
:% &
ControllerBase' 5
{ 
private 
readonly 
ILogger  
<  !
StatementController! 4
>4 5
_logger6 =
;= >
private 
readonly 
IMapper  
_mapper! (
;( )
private 
readonly  
IStatementRepository - 
_statementRepository. B
;B C
public 
StatementController "
(" #
ILogger# *
<* +
StatementController+ >
>> ?
logger@ F
,F G 
IStatementRepositoryH \
statementRepository] p
,p q
IMapperr y
mapper	z Ä
)
Ä Å
{ 	
_logger 
= 
logger 
;  
_statementRepository  
=! "
statementRepository# 6
;6 7
_mapper 
= 
mapper 
; 
} 	
[!! 	
HttpGet!!	 
(!! 
$str!! 
,!! 
Name!! 
=!! 
$str!!  %
)!!% &
]!!& '
public"" 
async"" 
Task"" 
<"" 
ActionResult"" &
>""& '
Get""( +
(""+ ,
int"", /
id""0 2
)""2 3
{## 	
try$$ 
{%% 
var&& 
	statement&& 
=&& 
await&&  % 
_statementRepository&&& :
.&&: ;
GetStatement&&; G
(&&G H
id&&H J
,&&J K
DateTime&&L T
.&&T U
Now&&U X
.&&X Y
	AddMonths&&Y b
(&&b c
-&&c d
$num&&d e
)&&e f
,&&f g
DateTime&&h p
.&&p q
Now&&q t
)&&t u
;&&u v
if'' 
('' 
	statement'' 
==''  
null''! %
)''% &
{(( 
return)) 
NotFound)) #
())# $
)))$ %
;))% &
}** 
var++ 
result++ 
=++ 
_mapper++ $
.++$ %
Map++% (
<++( )
List++) -
<++- .
StatementResponse++. ?
>++? @
>++@ A
(++A B
	statement++B K
)++K L
;++L M
_logger,, 
.,, 
LogInformation,, &
(,,& '
$",,' )
$str,,) P
{,,P Q
id,,Q S
},,S T
",,T U
),,U V
;,,V W
return.. 
Ok.. 
(.. 
result..  
)..  !
;..! "
}// 
catch11 
(11 
	Exception11 
ex11 
)11  
{22 
_logger33 
.33 
LogTrace33  
(33  !
ex33! #
,33# $
$"33% '
$str33' [
{33[ \
id33\ ^
}33^ _
"33_ `
)33` a
;33a b
return44 

StatusCode44 !
(44! "
StatusCodes44" -
.44- .(
Status500InternalServerError44. J
)44J K
;44K L
}55 
}66 	
[99 	
HttpGet99	 
]99 
[:: 	
	Authorize::	 
(:: 
Roles:: 
=:: 
$str:: *
)::* +
]::+ ,
public;; 
async;; 
Task;; 
<;; 
ActionResult;; &
>;;& '
Get;;( +
(;;+ ,
[;;, -
	FromQuery;;- 6
];;6 7
StatementRequest;;8 H
request;;I P
);;P Q
{<< 	
if>> 
(>> 
!>> 

ModelState>> 
.>> 
IsValid>> #
)>># $
{?? 
var@@ 
errors@@ 
=@@ 

ModelState@@ '
.@@' (
Values@@( .
.@@. /

SelectMany@@/ 9
(@@9 :
v@@: ;
=>@@< >
v@@? @
.@@@ A
Errors@@A G
)@@G H
;@@H I
_loggerAA 
.AA 
LogErrorAA  
(AA  !
$"AA! #
$strAA# ^
{AA^ _
requestAA_ f
.AAf g
	AccountIdAAg p
}AAp q
"AAq r
,AAr s
errorsAAt z
)AAz {
;AA{ |
returnBB 

BadRequestBB !
(BB! "

modelStateBB" ,
:BB, -

ModelStateBB. 8
)BB8 9
;BB9 :
}CC 
ifDD 
(DD 
requestDD 
.DD 

FromAmountDD "
>DD# $
requestDD% ,
.DD, -
ToAmountDD- 5
||DD6 8
requestDD9 @
.DD@ A
FromDateDDA I
>DDJ K
requestDDL S
.DDS T
ToDateDDT Z
)DDZ [
{EE 
_loggerFF 
.FF 
LogErrorFF  
(FF  !
$"FF! #
$strFF# ^
{FF^ _
requestFF_ f
.FFf g
	AccountIdFFg p
}FFp q
"FFq r
,FFr s
$str	FFt É
)
FFÉ Ñ
;
FFÑ Ö
returnGG 

BadRequestGG !
(GG! "
$strGG" 1
)GG1 2
;GG2 3
}HH 
tryII 
{JJ 
ListKK 
<KK 
	StatementKK 
>KK 
	statementKK  )
=KK* +
newKK, /
ListKK0 4
<KK4 5
	StatementKK5 >
>KK> ?
(KK? @
)KK@ A
;KKA B
boolLL 
isNullAmountRangeLL &
=LL' (
requestLL) 0
.LL0 1

FromAmountLL1 ;
==LL< >
nullLL? C
||LLD F
requestLLG N
.LLN O
ToAmountLLO W
==LLX Z
nullLL[ _
;LL_ `
boolMM 
isNullDateRangeMM $
=MM% &
requestMM' .
.MM. /
FromDateMM/ 7
==MM8 :
nullMM; ?
||MM@ B
requestMMC J
.MMJ K
ToDateMMK Q
==MMR T
nullMMU Y
;MMY Z
ifOO 
(OO 
isNullDateRangeOO #
&&OO$ &
isNullAmountRangeOO' 8
)OO8 9
{PP 
	statementQQ 
=QQ 
awaitQQ  % 
_statementRepositoryQQ& :
.QQ: ;
GetStatementQQ; G
(QQG H
requestQQH O
.QQO P
	AccountIdQQP Y
,QQY Z
DateTimeQQ[ c
.QQc d
NowQQd g
.QQg h
	AddMonthsQQh q
(QQq r
-QQr s
$numQQs t
)QQt u
,QQu v
DateTimeQQw 
.	QQ Ä
Now
QQÄ É
)
QQÉ Ñ
;
QQÑ Ö
}RR 
ifSS 
(SS 
isNullDateRangeSS #
&&SS$ &
!SS' (
isNullAmountRangeSS( 9
)SS9 :
{TT 
	statementUU 
=UU 
awaitUU  % 
_statementRepositoryUU& :
.UU: ;
GetStatementUU; G
(UUG H
requestUUH O
.UUO P
	AccountIdUUP Y
,UUY Z
DateTimeUU[ c
.UUc d
NowUUd g
.UUg h
	AddMonthsUUh q
(UUq r
-UUr s
$numUUs t
)UUt u
,UUu v
DateTimeUUw 
.	UU Ä
Now
UUÄ É
,
UUÉ Ñ
(
UUÖ Ü
decimal
UUÜ ç
)
UUç é
request
UUé ï
.
UUï ñ

FromAmount
UUñ †
,
UU† °
(
UU¢ £
decimal
UU£ ™
)
UU™ ´
request
UU´ ≤
.
UU≤ ≥
ToAmount
UU≥ ª
)
UUª º
;
UUº Ω
}VV 
ifWW 
(WW 
!WW 
isNullDateRangeWW $
&&WW% '
isNullAmountRangeWW( 9
)WW9 :
{XX 
	statementYY 
=YY 
awaitYY  % 
_statementRepositoryYY& :
.YY: ;
GetStatementYY; G
(YYG H
requestYYH O
.YYO P
	AccountIdYYP Y
,YYY Z
requestYY[ b
.YYb c
FromDateYYc k
,YYk l
requestYYm t
.YYt u
ToDateYYu {
)YY{ |
;YY| }
}ZZ 
if[[ 
([[ 
![[ 
isNullDateRange[[ $
&&[[% '
![[( )
isNullAmountRange[[) :
)[[: ;
{\\ 
	statement]] 
=]] 
await]]  % 
_statementRepository]]& :
.]]: ;
GetStatement]]; G
(]]G H
request]]H O
.]]O P
	AccountId]]P Y
,]]Y Z
request]][ b
.]]b c
FromDate]]c k
,]]k l
request]]m t
.]]t u
ToDate]]u {
,]]{ |
(]]} ~
decimal	]]~ Ö
)
]]Ö Ü
request
]]Ü ç
.
]]ç é

FromAmount
]]é ò
,
]]ò ô
(
]]ö õ
decimal
]]õ ¢
)
]]¢ £
request
]]£ ™
.
]]™ ´
ToAmount
]]´ ≥
)
]]≥ ¥
;
]]¥ µ
}^^ 
var__ 
result__ 
=__ 
_mapper__ $
.__$ %
Map__% (
<__( )
List__) -
<__- .
StatementResponse__. ?
>__? @
>__@ A
(__A B
	statement__B K
)__K L
;__L M
_logger`` 
.`` 
LogInformation`` &
(``& '
$"``' )
$str``) P
{``P Q
request``Q X
.``X Y
	AccountId``Y b
}``b c
"``c d
)``d e
;``e f
returnbb 
Okbb 
(bb 
resultbb  
)bb  !
;bb! "
}cc 
catchee 
(ee 
	Exceptionee 
exee 
)ee  
{ff 
_loggergg 
.gg 
LogTracegg  
(gg  !
exgg! #
,gg# $
$"gg% '
$strgg' [
{gg[ \
requestgg\ c
.ggc d
	AccountIdggd m
}ggm n
"ggn o
)ggo p
;ggp q
returnhh 

StatusCodehh !
(hh! "
StatusCodeshh" -
.hh- .(
Status500InternalServerErrorhh. J
)hhJ K
;hhK L
}ii 
}jj 	
}ll 
}mm √P
x/Users/abdulhadi.elhussain/Projects/AbdulhadiNagarroAssignment/AbdulhadiNagarroAssignment/Controllers/TokenController.cs
	namespace 	&
AbdulhadiNagarroAssignment
 $
.$ %
Controllers% 0
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
TokenController  
:! "
ControllerBase# 1
{ 
private 
IConfiguration 
_config &
;& '
private 
readonly 
IMapper  
_mapper! (
;( )
private 
readonly 
IUserRepository (
_userRepository) 8
;8 9
private 
readonly 
ILogger  
<  !
TokenController! 0
>0 1
_logger2 9
;9 :
public 
TokenController 
( 
IConfiguration -
config. 4
,4 5
IUserRepository6 E
userRepositoryF T
,T U
IMapperV ]
mapper^ d
,d e
ILoggerf m
<m n
TokenControllern }
>} ~
logger	 Ö
)
Ö Ü
{ 	
_userRepository 
= 
userRepository ,
;, -
_config   
=   
config   
;   
_mapper!! 
=!! 
mapper!! 
;!! 
_logger"" 
="" 
logger"" 
;"" 
}## 	
[%% 	
Consumes%%	 
(%% 
MediaTypeNames%%  
.%%  !
Application%%! ,
.%%, -
Json%%- 1
)%%1 2
]%%2 3
[&& 	
HttpPost&&	 
]&& 
['' 	
Route''	 
('' 
$str'' 
)'' 
]'' 
public(( 
async(( 
Task(( 
<(( 
IActionResult(( '
>((' (!
AuthenticateUserAsync(() >
(((> ?
[((? @
FromBody((@ H
]((H I#
AuthenticateUserRequest((J a
request((b i
)((i j
{)) 	
if++ 
(++ 
!++ 

ModelState++ 
.++ 
IsValid++ #
)++# $
{,, 
var-- 
errors-- 
=-- 

ModelState-- '
.--' (
Values--( .
.--. /

SelectMany--/ 9
(--9 :
v--: ;
=>--< >
v--? @
.--@ A
Errors--A G
)--G H
;--H I
_logger.. 
... 
LogError..  
(..  !
$"..! #
$str..# S
{..S T
request..T [
...[ \
Username..\ d
}..d e
"..e f
,..f g
errors..h n
)..n o
;..o p
return// 

BadRequest// !
(//! "

modelState//" ,
://, -

ModelState//. 8
)//8 9
;//9 :
}00 
try11 
{22 
User44 
?44 
result44 
=44 
await44 $
_userRepository44% 4
.444 5
GetUser445 <
(44< =
request44= D
.44D E
Username44E M
,44M N
request44O V
.44V W
Password44W _
)44_ `
;44` a
if55 
(55 
result55 
==55 
null55 "
)55" #
{66 
return77 
Unauthorized77 '
(77' (
$str77( =
)77= >
;77> ?
}88 
var99 
lastSesstion99  
=99! "
await99# (
_userRepository99) 8
.998 9
GetLatestSession999 I
(99I J
result99J P
.99P Q
Id99Q S
)99S T
;99T U
if:: 
(:: 
lastSesstion::  
!=::! #
null::$ (
&&::) +
lastSesstion::, 8
.::8 9

ExpiryTime::9 C
>::D E
DateTime::F N
.::N O
Now::O R
)::R S
{;; 
return<< 
Forbid<< !
(<<! "
)<<" #
;<<# $
}== 
var>> $
authenticateUserResponse>> ,
=>>- .
_mapper>>/ 6
.>>6 7
Map>>7 :
<>>: ;$
AuthenticateUserResponse>>; S
>>>S T
(>>T U
result>>U [
)>>[ \
;>>\ ]
_userRepository?? 
.??  

AddSession??  *
(??* +
new??+ .
Session??/ 6
{??7 8
UserId??9 ?
=??@ A
result??B H
.??H I
Id??I K
,??K L
	StartTime??M V
=??W X
DateTime??Y a
.??a b
Now??b e
,??e f

ExpiryTime??g q
=??r s
DateTime??t |
.??| }
Now	??} Ä
.
??Ä Å

AddMinutes
??Å ã
(
??ã å
int
??å è
.
??è ê
Parse
??ê ï
(
??ï ñ
_config
??ñ ù
[
??ù û
$str
??û ™
]
??™ ´
)
??´ ¨
)
??¨ ≠
}
??Æ Ø
)
??Ø ∞
;
??∞ ±
_logger@@ 
.@@ 
LogInformation@@ &
(@@& '
$"@@' )
$str@@) E
{@@E F
request@@F M
.@@M N
Username@@N V
}@@V W
"@@W X
)@@X Y
;@@Y Z
returnAA 
OkAA 
(AA 
GenerateTokenAA '
(AA' ($
authenticateUserResponseAA( @
)AA@ A
)AAA B
;AAB C
}BB 
catchCC 
(CC 
	ExceptionCC 
exCC 
)CC  
{DD 
_loggerEE 
.EE 
LogTraceEE  
(EE  !
exEE! #
,EE# $
$"EE% '
$strEE' P
{EEP Q
requestEEQ X
.EEX Y
UsernameEEY a
}EEa b
"EEb c
)EEc d
;EEd e
returnFF 

StatusCodeFF !
(FF! "
StatusCodesFF" -
.FF- .(
Status500InternalServerErrorFF. J
)FFJ K
;FFK L
}GG 
}HH 	
privateKK 
stringKK 
GenerateTokenKK $
(KK$ %$
AuthenticateUserResponseKK% =
userInfoKK> F
)KKF G
{LL 	
varMM 
securityKeyMM 
=MM 
newMM ! 
SymmetricSecurityKeyMM" 6
(MM6 7
EncodingMM7 ?
.MM? @
UTF8MM@ D
.MMD E
GetBytesMME M
(MMM N
_configMMN U
[MMU V
$strMMV _
]MM_ `
)MM` a
)MMa b
;MMb c
varNN 
tokenExpiryNN 
=NN 
intNN !
.NN! "
ParseNN" '
(NN' (
_configNN( /
[NN/ 0
$strNN0 <
]NN< =
)NN= >
;NN> ?
varOO 
credentialsOO 
=OO 
newOO !
SigningCredentialsOO" 4
(OO4 5
securityKeyOO5 @
,OO@ A
SecurityAlgorithmsOOB T
.OOT U

HmacSha256OOU _
)OO_ `
;OO` a
varPP 
claimsPP 
=PP 
newPP 
ListPP !
<PP! "
ClaimPP" '
>PP' (
{PP( )
newQQ 
ClaimQQ 
(QQ #
JwtRegisteredClaimNamesQQ -
.QQ- .
SubQQ. 1
,QQ1 2
_configQQ3 :
[QQ: ;
$strQQ; H
]QQH I
)QQI J
,QQJ K
newRR 
ClaimRR 
(RR #
JwtRegisteredClaimNamesRR -
.RR- .
JtiRR. 1
,RR1 2
GuidRR3 7
.RR7 8
NewGuidRR8 ?
(RR? @
)RR@ A
.RRA B
ToStringRRB J
(RRJ K
)RRK L
)RRL M
,RRM N
newSS 
ClaimSS 
(SS #
JwtRegisteredClaimNamesSS -
.SS- .
IatSS. 1
,SS1 2
DateTimeSS3 ;
.SS; <
UtcNowSS< B
.SSB C
ToStringSSC K
(SSK L
)SSL M
)SSM N
,SSN O
newTT 
ClaimTT 
(TT 
$strTT 
,TT 
userInfoTT  (
.TT( )
IdTT) +
.TT+ ,
ToStringTT, 4
(TT4 5
)TT5 6
)TT6 7
,TT7 8
newUU 
ClaimUU 
(UU 
$strUU #
,UU# $
userInfoUU% -
.UU- .
DisplayNameUU. 9
)UU9 :
,UU: ;
newVV 
ClaimVV 
(VV 
$strVV  
,VV  !
userInfoVV" *
.VV* +
UserNameVV+ 3
)VV3 4
,VV4 5
}WW 	
;WW	 

userInfoXX 
.XX 
RolesXX 
.XX 
ForEachXX "
(XX" #
xXX# $
=>XX% '
{YY 
claimsZZ 
.ZZ 
AddZZ 
(ZZ 
newZZ 
ClaimZZ $
(ZZ$ %

ClaimTypesZZ% /
.ZZ/ 0
RoleZZ0 4
,ZZ4 5
xZZ6 7
)ZZ7 8
)ZZ8 9
;ZZ9 :
}[[ 
)[[ 
;[[ 
var\\ 
token\\ 
=\\ 
new\\ 
JwtSecurityToken\\ ,
(\\, -
_config\\- 4
[\\4 5
$str\\5 A
]\\A B
,\\B C
_config]] 
[]] 
$str]] &
]]]& '
,]]' (
claims^^ 
,^^ 
expires__ 
:__ 
DateTime__ !
.__! "
Now__" %
.__% &

AddMinutes__& 0
(__0 1
tokenExpiry__1 <
)__< =
,__= >
signingCredentials`` "
:``" #
credentials``$ /
)``/ 0
;``0 1
returnbb 
newbb #
JwtSecurityTokenHandlerbb .
(bb. /
)bb/ 0
.bb0 1

WriteTokenbb1 ;
(bb; <
tokenbb< A
)bbA B
;bbB C
}cc 	
}dd 
}ee ˛
y/Users/abdulhadi.elhussain/Projects/AbdulhadiNagarroAssignment/AbdulhadiNagarroAssignment/DTOs/AuthenticateUserRequest.cs
	namespace 	&
AbdulhadiNagarroAssignment
 $
.$ %
DTOs% )
{ 
public 
record #
AuthenticateUserRequest &
{ 
[ 	
Required	 
] 
public		 
string		 
Username		 
{		  
get		! $
;		$ %
set		& )
;		) *
}		+ ,
[

 	
Required

	 
]

 
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} §
z/Users/abdulhadi.elhussain/Projects/AbdulhadiNagarroAssignment/AbdulhadiNagarroAssignment/DTOs/AuthenticateUserResponse.cs
	namespace 	&
AbdulhadiNagarroAssignment
 $
.$ %
DTOs% )
{ 
public 
record $
AuthenticateUserResponse '
{ 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
string 
? 
UserName 
{  !
get" %
;% &
set' *
;* +
}, -
public		 
string		 
?		 
DisplayName		 "
{		# $
get		% (
;		( )
set		* -
;		- .
}		/ 0
public

 
List

 
<

 
string

 
>

 
?

 
Roles

 "
{

# $
get

% (
;

( )
set

* -
;

- .
}

/ 0
} 
} –	
r/Users/abdulhadi.elhussain/Projects/AbdulhadiNagarroAssignment/AbdulhadiNagarroAssignment/DTOs/StatementRequest.cs
	namespace 	&
AbdulhadiNagarroAssignment
 $
.$ %
DTOs% )
{ 
public 
record 
StatementRequest 
{ 
[ 
Required 
] 
public		 
int			 
	AccountId		 
{		 
get		 
;		 
set		 !
;		! "
}		# $
public

 
DateTime

 
?

 
FromDate

 !
{

" #
get

$ '
;

' (
set

) ,
;

, -
}

. /
public 
DateTime	 
? 
ToDate 
{ 
get 
;  
set! $
;$ %
}& '
public 
Decimal 
? 

FromAmount "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
Decimal	 
? 
ToAmount 
{ 
get  
;  !
set" %
;% &
}' (
} 
} œ
s/Users/abdulhadi.elhussain/Projects/AbdulhadiNagarroAssignment/AbdulhadiNagarroAssignment/DTOs/StatementResponse.cs
	namespace 	&
AbdulhadiNagarroAssignment
 $
.$ %
DTOs% )
{ 
public 
record 
StatementResponse  
{ 
public 
int	 
Id 
{ 
get 
; 
set 
; 
} 
public 
decimal	 
Amount 
{ 
get 
; 
set "
;" #
}$ %
public 
DateTime	 
StatementDate 
{  !
get" %
;% &
set' *
;* +
}, -
public		 
string			 
?		 
	AccountId		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
} 
} Ä-
k/Users/abdulhadi.elhussain/Projects/AbdulhadiNagarroAssignment/AbdulhadiNagarroAssignment/MappingProfile.cs
	namespace		 	&
AbdulhadiNagarroAssignment		
 $
{

 
public 
class 
MappingProfile 
: 
Profile &
{ 
public 
MappingProfile	 
( 
) 
{ 
	CreateMap 
< 
User 
, $
AuthenticateUserResponse 4
>4 5
(5 6
)6 7
. 
	ForMember 
( 
dest 
=> !
dest" &
.& '
Roles' ,
,, -
opt. 1
=>2 4
opt5 8
.8 9
MapFrom9 @
(@ A
srcA D
=>E G
srcH K
.K L
RolesL Q
.Q R
SelectR X
(X Y
xY Z
=>[ ]
x^ _
._ `
Role` d
.d e
Namee i
)i j
.j k
ToListk q
(q r
)r s
)s t
)t u
. 
	ForMember 
( 
dest 
=> !
dest" &
.& '
Id' )
,) *
opt+ .
=>/ 1
opt2 5
.5 6
MapFrom6 =
(= >
src> A
=>B D
srcE H
.H I
IdI K
)K L
)L M
. 
	ForMember 
( 
dest 
=> !
dest" &
.& '
DisplayName' 2
,2 3
opt4 7
=>8 :
opt; >
.> ?
MapFrom? F
(F G
srcG J
=>K M
srcN Q
.Q R
DisplayNameR ]
)] ^
)^ _
. 
	ForMember 
( 
dest 
=> !
dest" &
.& '
UserName' /
,/ 0
opt1 4
=>5 7
opt8 ;
.; <
MapFrom< C
(C D
srcD G
=>H J
srcK N
.N O
UsernameO W
)W X
)X Y
;Y Z
	CreateMap 
< 
	Statement 
,  
StatementResponse! 2
>2 3
(3 4
)4 5
. 
	ForMember 
( 
dest 
=> !
dest" &
.& '
Id' )
,) *
opt+ .
=>/ 1
opt2 5
.5 6
MapFrom6 =
(= >
src> A
=>B D
srcE H
.H I
IdI K
)K L
)L M
. 
	ForMember 
( 
dest 
=> !
dest" &
.& '
	AccountId' 0
,0 1
opt2 5
=>6 8
opt9 <
.< =
MapFrom= D
(D E
srcE H
=>I K
ComputeSHA256HashL ]
(] ^
src^ a
.a b
	AccountIdb k
.k l
ToStringl t
(t u
)u v
)v w
)w x
)x y
. 
	ForMember 
( 
dest 
=> !
dest" &
.& '
StatementDate' 4
,4 5
opt6 9
=>: <
opt= @
.@ A
MapFromA H
(H I
srcI L
=>M O
DateTimeP X
.X Y
ParseY ^
(^ _
src_ b
.b c
StatementDatec p
)p q
)q r
)r s
. 
	ForMember 
( 
dest 
=> !
dest" &
.& '
Amount' -
,- .
opt/ 2
=>3 5
opt6 9
.9 :
MapFrom: A
(A B
srcB E
=>F H
decimalI P
.P Q
ParseQ V
(V W
srcW Z
.Z [
Amount[ a
)a b
)b c
)c d
;d e
} 	
private 
string 
ComputeSHA256Hash (
(( )
string) /
input0 5
)5 6
{ 	
using 
( 
SHA256 
sha256  
=! "
SHA256# )
.) *
Create* 0
(0 1
)1 2
)2 3
{   
byte!! 
[!! 
]!! 

inputBytes!! !
=!!" #
Encoding!!$ ,
.!!, -
UTF8!!- 1
.!!1 2
GetBytes!!2 :
(!!: ;
input!!; @
)!!@ A
;!!A B
byte"" 
["" 
]"" 
	hashBytes""  
=""! "
sha256""# )
."") *
ComputeHash""* 5
(""5 6

inputBytes""6 @
)""@ A
;""A B
StringBuilder## 
sb##  
=##! "
new### &
StringBuilder##' 4
(##4 5
)##5 6
;##6 7
foreach$$ 
($$ 
byte$$ 
b$$ 
in$$  "
	hashBytes$$# ,
)$$, -
{%% 
sb&& 
.&& 
Append&& 
(&& 
b&& 
.&&  
ToString&&  (
(&&( )
$str&&) -
)&&- .
)&&. /
;&&/ 0
}'' 
return(( 
sb(( 
.(( 
ToString(( "
(((" #
)((# $
;(($ %
})) 
}** 	
}++ 
},, Ú+
d/Users/abdulhadi.elhussain/Projects/AbdulhadiNagarroAssignment/AbdulhadiNagarroAssignment/Program.cs
var 
builder 
= 
WebApplication 
. 
CreateBuilder *
(* +
args+ /
)/ 0
;0 1
builder 
. 
Services 
. 
AddControllers 
(  
)  !
;! "
builder 
. 
Services 
. 
AddDbContext 
< "
AccountsManagerContext 4
>4 5
(5 6
opt6 9
=>: <
opt= @
.@ A
UseInMemoryDatabaseA T
(T U
databaseNameU a
:a b
$strc l
)l m
)m n
;n o
builder 
. 
Services 
. 
	AddScoped 
< 
IUserRepository *
,* +
UserRepository, :
>: ;
(; <
)< =
;= >
builder 
. 
Services 
. 
	AddScoped 
<  
IStatementRepository /
,/ 0
StatementRepository1 D
>D E
(E F
)F G
;G H
builder 
. 
Services 
. 

AddLogging 
( 
) 
; 
builder 
. 
Services 
. #
AddEndpointsApiExplorer (
(( )
)) *
;* +
builder 
. 
Services 
. 
AddSwaggerGen 
( 
)  
;  !
builder 
. 
Services 
. 
AddAuthentication "
(" #
JwtBearerDefaults# 4
.4 5 
AuthenticationScheme5 I
)I J
.J K
AddJwtBearerK W
(W X
opX Z
=>[ ]
op 

.
 %
TokenValidationParameters $
=% &
new' *%
TokenValidationParameters+ D
{ 	
ValidateIssuer 
= 
true !
,! "
ValidateAudience 
= 
true #
,# $
ValidateLifetime 
= 
true #
,# $$
ValidateIssuerSigningKey   $
=  % &
true  ' +
,  + ,
ValidIssuer!! 
=!! 
builder!! !
.!!! "
Configuration!!" /
[!!/ 0
$str!!0 <
]!!< =
,!!= >
ValidAudience"" 
="" 
builder"" #
.""# $
Configuration""$ 1
[""1 2
$str""2 @
]""@ A
,""A B
IssuerSigningKey## 
=## 
new## " 
SymmetricSecurityKey### 7
(##7 8
Encoding##8 @
.##@ A
UTF8##A E
.##E F
GetBytes##F N
(##N O
builder##O V
.##V W
Configuration##W d
[##d e
$str##e n
]##n o
)##o p
)##p q
}$$ 	
)$$	 

;$$
 
builder%% 
.%% 
Services%% 
.%% 
AddAutoMapper%% 
(%% 
typeof%% %
(%%% &
MappingProfile%%& 4
)%%4 5
)%%5 6
;%%6 7
var'' 
app'' 
='' 	
builder''
 
.'' 
Build'' 
('' 
)'' 
;'' 
if** 
(** 
app** 
.** 
Environment** 
.** 
IsDevelopment** !
(**! "
)**" #
)**# $
{++ 
app,, 
.,, 

UseSwagger,, 
(,, 
),, 
;,, 
app-- 
.-- 
UseSwaggerUI-- 
(-- 
)-- 
;-- 
}.. 
using11 
(11 
var11 

scope11 
=11 
app11 
.11 
Services11 
.11  
CreateScope11  +
(11+ ,
)11, -
)11- .
{22 
var33 
scopedProvider33 
=33 
scope33 
.33 
ServiceProvider33 .
;33. /
try44 
{55 
var66 
context66 
=66 
scopedProvider66 $
.66$ %
GetRequiredService66% 7
<667 8"
AccountsManagerContext668 N
>66N O
(66O P
)66P Q
;66Q R
await77 
context77 
.77 
	SeedAsync77 
(77  
)77  !
;77! "
}88 
catch99 	
(99
 
	Exception99 
e99 
)99 
{:: 
Console;; 
.;; 
	WriteLine;; 
(;; 
e;; 
);; 
;;; 
throw<< 
;<< 
}== 
}>> 
app@@ 
.@@ 
UseHttpsRedirection@@ 
(@@ 
)@@ 
;@@ 
appBB 
.BB 
UseAuthorizationBB 
(BB 
)BB 
;BB 
appDD 
.DD 
MapControllersDD 
(DD 
)DD 
;DD 
appFF 
.FF 
RunFF 
(FF 
)FF 	
;FF	 

publicGG 
partialGG 
classGG 
ProgramGG 
{GG 
}GG  