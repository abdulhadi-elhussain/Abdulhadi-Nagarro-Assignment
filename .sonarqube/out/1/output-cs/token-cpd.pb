©(
é/Users/abdulhadi.elhussain/Projects/AbdulhadiNagarroAssignment/AbdulhadiNagarroAssignment.Infrastructure/Persistence/AccountsManagerContext.cs
	namespace

 	&
AbdulhadiNagarroAssignment


 $
.

$ %
Infrastructure

% 3
.

3 4
Persistence

4 ?
{ 
public 
class "
AccountsManagerContext $
:% &
	DbContext' 0
{ 
public "
AccountsManagerContext %
(% &
DbContextOptions& 6
<6 7"
AccountsManagerContext7 M
>M N
optionsO V
)V W
:X Y
baseZ ^
(^ _
options_ f
)f g
{ 	
} 	
public 
DbSet 
< 
Account 
> 
Accounts &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
DbSet 
< 
	Statement 
> 

Statements  *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public 
DbSet 
< 
Role 
? 
> 
Roles !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
DbSet 
< 
User 
? 
> 
Users !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
DbSet 
< 
UserRole 
? 
> 

UsersRoles  *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public 
DbSet 
< 
Session 
? 
> 
Sessions '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
	protected 
override 
void 
OnConfiguring  -
(- .#
DbContextOptionsBuilder. E
optionsBuilderF T
)T U
{ 	
optionsBuilder 
. !
UseLazyLoadingProxies 0
(0 1
)1 2
;2 3
optionsBuilder   
.   
UseInMemoryDatabase   .
(  . /
$str  / 8
,  8 9
b  : ;
=>  < >
b  ? @
.  @ A
EnableNullChecks  A Q
(  Q R
false  R W
)  W X
)  X Y
;  Y Z
}!! 	
	protected## 
override## 
void## 
OnModelCreating##  /
(##/ 0
ModelBuilder##0 <
modelBuilder##= I
)##I J
{$$ 	
modelBuilder'' 
.'' 
Entity'' 
<''  
User''  $
>''$ %
(''% &
)''& '
.''' (
Property''( 0
(''0 1
u''1 2
=>''3 5
u''6 7
.''7 8
Id''8 :
)'': ;
.''; <
ValueGeneratedOnAdd''< O
(''O P
)''P Q
;''Q R
modelBuilder(( 
.(( 
Entity(( 
<((  
Account((  '
>((' (
(((( )
)(() *
.((* +
Property((+ 3
(((3 4
a((4 5
=>((6 8
a((9 :
.((: ;
Id((; =
)((= >
.((> ?
ValueGeneratedOnAdd((? R
(((R S
)((S T
;((T U
modelBuilder)) 
.)) 
Entity)) 
<))  
	Statement))  )
>))) *
())* +
)))+ ,
.)), -
Property))- 5
())5 6
s))6 7
=>))8 :
s)); <
.))< =
Id))= ?
)))? @
.))@ A
ValueGeneratedOnAdd))A T
())T U
)))U V
;))V W
modelBuilder** 
.** 
Entity** 
<**  
Role**  $
>**$ %
(**% &
)**& '
.**' (
Property**( 0
(**0 1
r**1 2
=>**3 5
r**6 7
.**7 8
Id**8 :
)**: ;
.**; <
ValueGeneratedOnAdd**< O
(**O P
)**P Q
;**Q R
modelBuilder++ 
.++ 
Entity++ 
<++  
UserRole++  (
>++( )
(++) *
)++* +
.+++ ,
Property++, 4
(++4 5
ur++5 7
=>++8 :
ur++; =
.++= >
Id++> @
)++@ A
.++A B
ValueGeneratedOnAdd++B U
(++U V
)++V W
;++W X
base-- 
.-- 
OnModelCreating--  
(--  !
modelBuilder--! -
)--- .
;--. /
modelBuilder.. 
... +
ApplyConfigurationsFromAssembly.. 8
(..8 9
Assembly..9 A
...A B 
GetExecutingAssembly..B V
(..V W
)..W X
)..X Y
;..Y Z
}00 	
}11 
}22 ¬:
í/Users/abdulhadi.elhussain/Projects/AbdulhadiNagarroAssignment/AbdulhadiNagarroAssignment.Infrastructure/Persistence/AccountsManagerContextSeed.cs
	namespace 	&
AbdulhadiNagarroAssignment
 $
.$ %
Infrastructure% 3
.3 4
Persistence4 ?
{ 
public		 
static		 
class		 &
AccountsManagerContextSeed		 /
{

 
public 
static 
async 
Task  
	SeedAsync! *
(* +
this+ /"
AccountsManagerContext0 F
contextG N
)N O
{ 	
var 
	adminRole 
= 
new 
Role  $
{% &
Name' +
=, -
$str. =
}> ?
;? @
var 
userRole 
= 
new 
Role #
{$ %
Name& *
=+ ,
$str- 3
}4 5
;5 6
Role 
[ 
] 
roles 
= 
{ 
	adminRole &
,& '
userRole( 0
}1 2
;2 3
await 
context 
. 
Roles 
.  
AddRangeAsync  -
(- .
roles. 3
)3 4
;4 5
await 
context 
. 
SaveChangesAsync *
(* +
)+ ,
;, -
var 
	adminUser 
= 
new 
User  $
{ 
Username 
= 
$str "
," #
Password 
= 
$str "
," #
EmailAddress 
= 
$str @
,@ A
DisplayName 
= 
$str 3
,3 4
} 
; 
var 
userUser 
= 
new 
User #
{ 
Username 
= 
$str !
,! "
Password 
= 
$str !
,! "
EmailAddress 
= 
$str /
,/ 0
DisplayName 
= 
$str $
} 
; 
var 
	userUser2 
= 
new "
User# '
{   
Username!! 
=!! 
$str!! "
,!!" #
Password"" 
="" 
$str"" !
,""! "
EmailAddress## 
=## 
$str## /
,##/ 0
DisplayName$$ 
=$$ 
$str$$ $
}%% 
;%% 
await&& 
context&& 
.&& 
Users&& 
.&&  
AddRangeAsync&&  -
(&&- .
	adminUser&&. 7
,&&7 8
userUser&&9 A
,&&A B
	userUser2&&C L
)&&L M
;&&M N
await'' 
context'' 
.'' 
SaveChangesAsync'' *
(''* +
)''+ ,
;'', -
await(( 
context(( 
.(( 

UsersRoles(( $
.(($ %
AddRangeAsync((% 2
(((2 3
new((3 6
UserRole((7 ?
{((@ A
Role((B F
=((G H
	adminRole((I R
,((R S
User((T X
=((Y Z
	adminUser(([ d
}((e f
,((f g
new)) 
UserRole)) 
{)) 
Role)) #
=))$ %
userRole))& .
,)). /
User))0 4
=))5 6
userUser))7 ?
}))@ A
,))A B
new** 
UserRole** 
{** 
Role** #
=**$ %
userRole**& .
,**. /
User**0 4
=**5 6
	userUser2**7 @
}**A B
)**B C
;**C D
await++ 
context++ 
.++ 
SaveChangesAsync++ *
(++* +
)+++ ,
;++, -
List.. 
<.. 
Account.. 
>.. 
accounts.. "
=..# $
new..% (
List..) -
<..- .
Account... 5
>..5 6
(..6 7
)..7 8
;..8 9
accounts// 
.// 
Add// 
(// 
new// 
Account// $
{//% &
AccountNumber//' 4
=//5 6
$str//7 <
,//< =
AccountType//> I
=//J K
$str//L R
}//S T
)//T U
;//U V
accounts00 
.00 
Add00 
(00 
new00 
Account00 $
{00% &
AccountNumber00' 4
=005 6
$str007 <
,00< =
AccountType00> I
=00J K
$str00L R
}00S T
)00T U
;00U V
accounts11 
.11 
Add11 
(11 
new11 
Account11 $
{11% &
AccountNumber11' 4
=115 6
$str117 <
,11< =
AccountType11> I
=11J K
$str11L R
}11S T
)11T U
;11U V
await33 
context33 
.33 
Accounts33 "
.33" #
AddRangeAsync33# 0
(330 1
accounts331 9
)339 :
;33: ;
await44 
context44 
.44 
SaveChangesAsync44 *
(44* +
)44+ ,
;44, -
await66 
context66 
.66 

Statements66 $
.66$ %
AddRangeAsync66% 2
(662 3
new77 
	Statement77 
{77 
Account77  '
=77( )
accounts77* 2
[772 3
$num773 4
]774 5
,775 6
Amount777 =
=77> ?
$str77@ D
,77D E
StatementDate77F S
=77T U
$str77V b
}77c d
,77d e
new88 
	Statement88 
{88 
Account88  '
=88( )
accounts88* 2
[882 3
$num883 4
]884 5
,885 6
Amount887 =
=88> ?
$str88@ D
,88D E
StatementDate88F S
=88T U
$str88V b
}88c d
,88d e
new99 
	Statement99 
{99 
Account99  '
=99( )
accounts99* 2
[992 3
$num993 4
]994 5
,995 6
Amount997 =
=99> ?
$str99@ E
,99E F
StatementDate99G T
=99U V
$str99W c
}99d e
,99e f
new:: 
	Statement:: 
{:: 
Account::  '
=::( )
accounts::* 2
[::2 3
$num::3 4
]::4 5
,::5 6
Amount::7 =
=::> ?
$str::@ F
,::F G
StatementDate::H U
=::V W
$str::X d
}::e f
,::f g
new;; 
	Statement;; 
{;; 
Account;;  '
=;;( )
accounts;;* 2
[;;2 3
$num;;3 4
];;4 5
,;;5 6
Amount;;7 =
=;;> ?
$str;;@ D
,;;D E
StatementDate;;F S
=;;T U
$str;;V b
};;c d
)<< 
;<< 
await>> 
context>> 
.>> 
SaveChangesAsync>> *
(>>* +
)>>+ ,
;>>, -
}?? 	
}AA 
}BB Ô
ñ/Users/abdulhadi.elhussain/Projects/AbdulhadiNagarroAssignment/AbdulhadiNagarroAssignment.Infrastructure/Persistence/Repositories/GenericRepository.cs
	namespace 	&
AbdulhadiNagarroAssignment
 $
.$ %
Infrastructure% 3
.3 4
Persistence4 ?
.? @
Repositories@ L
{ 
public 
abstract 
class 
GenericRepository (
{ 
	protected 
readonly "
AccountsManagerContext 1
context2 9
;9 :
	protected		 
GenericRepository		 #
(		# $"
AccountsManagerContext		$ :
context		; B
)		B C
{

 	
this 
. 
context 
= 
context "
;" #
} 	
} 
} Ô

ô/Users/abdulhadi.elhussain/Projects/AbdulhadiNagarroAssignment/AbdulhadiNagarroAssignment.Infrastructure/Persistence/Repositories/IStatementRepository.cs
	namespace 	&
AbdulhadiNagarroAssignment
 $
.$ %
Infrastructure% 3
.3 4
Persistence4 ?
.? @
Repositories@ L
{ 
public 

	interface  
IStatementRepository )
{ 
public 
Task 
< 
List 
< 
	Statement "
>" #
># $
GetStatement% 1
(1 2
int2 5
	accountId6 ?
,? @
DateTimeA I
?I J
fromDateK S
,S T
DateTimeU ]
?] ^
toDate_ e
,e f
decimalg n

fromAmounto y
,y z
decimal	{ Ç
toAmount
É ã
)
ã å
;
å ç
public		 
Task		 
<		 
List		 
<		 
	Statement		 "
>		" #
>		# $
GetStatement		% 1
(		1 2
int		2 5
	accountId		6 ?
,		? @
DateTime		A I
?		I J
fromDate		K S
,		S T
DateTime		U ]
?		] ^
toDate		_ e
)		e f
;		f g
}

 
} â	
î/Users/abdulhadi.elhussain/Projects/AbdulhadiNagarroAssignment/AbdulhadiNagarroAssignment.Infrastructure/Persistence/Repositories/IUserRepository.cs
	namespace 	&
AbdulhadiNagarroAssignment
 $
.$ %
Infrastructure% 3
.3 4
Persistence4 ?
.? @
Repositories@ L
{ 
public 

	interface 
IUserRepository $
{ 
public 
Task 
< 
User 
? 
> 
GetUser "
(" #
string# )
username* 2
,2 3
string4 :
password; C
)C D
;D E
public		 
Task		 
<		 
Session		 
?		 
>		 
GetLatestSession		 .
(		. /
int		/ 2
userId		3 9
)		9 :
;		: ;
public

 
Task

 
<

 
Session

 
?

 
>

 

AddSession

 (
(

( )
Session

) 0
session

1 8
)

8 9
;

9 :
} 
} î
ò/Users/abdulhadi.elhussain/Projects/AbdulhadiNagarroAssignment/AbdulhadiNagarroAssignment.Infrastructure/Persistence/Repositories/StatementRepository.cs
	namespace 	&
AbdulhadiNagarroAssignment
 $
.$ %
Infrastructure% 3
.3 4
Persistence4 ?
.? @
Repositories@ L
{ 
public 

class 
StatementRepository $
:% &
GenericRepository' 8
,8 9 
IStatementRepository: N
{ 
public		 
StatementRepository		 "
(		" #"
AccountsManagerContext		# 9
context		: A
)		A B
:		C D
base		E I
(		I J
context		J Q
)		Q R
{

 	
} 	
public 
async 
Task 
< 
List 
< 
	Statement (
>( )
>) *
GetStatement+ 7
(7 8
int8 ;
	accountId< E
,E F
DateTimeG O
?O P
fromDateQ Y
,Y Z
DateTime[ c
?c d
toDatee k
,k l
decimalm t

fromAmountu 
,	 Ä
decimal
Å à
toAmount
â ë
)
ë í
{ 	
return 
await 
context  
.  !

Statements! +
.+ ,
Where, 1
(1 2
s2 3
=>4 6
s7 8
.8 9
	AccountId9 B
==C E
	accountIdF O
&&P R
Convert #
.# $

ToDateTime$ .
(. /
s/ 0
.0 1
StatementDate1 >
)> ?
>=@ B
fromDateC K
&&L N
Convert #
.# $

ToDateTime$ .
(. /
s/ 0
.0 1
StatementDate1 >
)> ?
<=@ B
toDateC I
&&J L
Convert #
.# $
	ToDecimal$ -
(- .
s. /
./ 0
Amount0 6
)6 7
>=8 :

fromAmount; E
&&F H
Convert #
.# $
	ToDecimal$ -
(- .
s. /
./ 0
Amount0 6
)6 7
<=8 :
toAmount; C
)C D
.D E
ToListAsyncE P
(P Q
)Q R
;R S
} 	
public 
async 
Task 
< 
List 
< 
	Statement (
>( )
>) *
GetStatement+ 7
(7 8
int8 ;
	accountId< E
,E F
DateTimeG O
?O P
fromDateQ Y
,Y Z
DateTime[ c
?c d
toDatee k
)k l
{ 	
return 
await 
context  
.  !

Statements! +
.+ ,
Where, 1
(1 2
s2 3
=>4 6
s7 8
.8 9
	AccountId9 B
==C E
	accountIdF O
&&P R
Convert #
.# $

ToDateTime$ .
(. /
s/ 0
.0 1
StatementDate1 >
)> ?
>=@ B
fromDateC K
&&L N
Convert #
.# $

ToDateTime$ .
(. /
s/ 0
.0 1
StatementDate1 >
)> ?
<=@ B
toDateC I
)I J
.J K
ToListAsyncK V
(V W
)W X
;X Y
} 	
} 
} £
ì/Users/abdulhadi.elhussain/Projects/AbdulhadiNagarroAssignment/AbdulhadiNagarroAssignment.Infrastructure/Persistence/Repositories/UserRepository.cs
	namespace 	&
AbdulhadiNagarroAssignment
 $
.$ %
Infrastructure% 3
.3 4
Persistence4 ?
.? @
Repositories@ L
{ 
public 

class 
UserRepository 
:  !
GenericRepository" 3
,3 4
IUserRepository5 D
{ 
public		 
UserRepository		 
(		 "
AccountsManagerContext		 4
context		5 <
)		< =
:		> ?
base		@ D
(		D E
context		E L
)		L M
{

 	
} 	
public 
async 
Task 
< 
Session !
>! "

AddSession# -
(- .
Session. 5
session6 =
)= >
{ 	
var 
result 
= 
await 
context &
.& '
Sessions' /
./ 0
AddAsync0 8
(8 9
session9 @
)@ A
;A B
await 
context 
. 
SaveChangesAsync *
(* +
)+ ,
;, -
return 
result 
. 
Entity  
;  !
} 	
public 
async 
Task 
< 
Session !
?! "
>" #
GetLatestSession$ 4
(4 5
int5 8
userId9 ?
)? @
{ 	
return 
await 
context  
.  !
Sessions! )
.) *
Where* /
(/ 0
s0 1
=>2 4
s5 6
.6 7
UserId7 =
==> @
userIdA G
)G H
. 
OrderByDescending "
(" #
s# $
=>% '
s( )
.) *
	StartTime* 3
)3 4
.4 5
FirstOrDefaultAsync5 H
(H I
)I J
;J K
} 	
public 
async 
Task 
< 
User 
? 
>  
GetUser! (
(( )
string) /
username0 8
,8 9
string: @
passwordA I
)I J
{ 	
return 
await 
context  
.  !
Users! &
.& ' 
SingleOrDefaultAsync' ;
(; <
x< =
=>> @
xA B
.B C
UsernameC K
==L N
usernameO W
&&X Z
x[ \
.\ ]
Password] e
==f h
passwordi q
)q r
;r s
} 	
} 
} 