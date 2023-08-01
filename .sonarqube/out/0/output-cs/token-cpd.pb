Ñ
r/Users/abdulhadi.elhussain/Projects/AbdulhadiNagarroAssignment/AbdulhadiNagarroAssignment.Domain/Models/Account.cs
	namespace 	&
AbdulhadiNagarroAssignment
 $
.$ %
Domain% +
.+ ,
Models, 2
{ 
public 

class 
Account 
: 
	BaseModel $
{ 
public 
string 
AccountType !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
AccountNumber #
{$ %
get& )
;) *
set+ .
;. /
}0 1
} 
}		 Ä
t/Users/abdulhadi.elhussain/Projects/AbdulhadiNagarroAssignment/AbdulhadiNagarroAssignment.Domain/Models/BaseModel.cs
	namespace 	&
AbdulhadiNagarroAssignment
 $
.$ %
Domain% +
.+ ,
Models, 2
{ 
public 
abstract 
class 
	BaseModel  
{ 
public 
virtual 
int 
Id 
{ 
get  #
;# $
	protected% .
set/ 2
;2 3
}4 5
} 
} £
o/Users/abdulhadi.elhussain/Projects/AbdulhadiNagarroAssignment/AbdulhadiNagarroAssignment.Domain/Models/Role.cs
	namespace 	&
AbdulhadiNagarroAssignment
 $
.$ %
Domain% +
.+ ,
Models, 2
{ 
public 

class 
Role 
: 
	BaseModel !
{ 
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
} 
}		 ’
r/Users/abdulhadi.elhussain/Projects/AbdulhadiNagarroAssignment/AbdulhadiNagarroAssignment.Domain/Models/Session.cs
	namespace 	&
AbdulhadiNagarroAssignment
 $
.$ %
Domain% +
.+ ,
Models, 2
{ 
public 
class 
Session 
: 
	BaseModel !
{ 
public 
virtual	 
User 
User 
{ 
get  
;  !
set" %
;% &
}' (
public 
int	 
UserId 
{ 
get 
; 
set 
; 
}  !
public 
DateTime	 
	StartTime 
{ 
get !
;! "
set# &
;& '
}( )
public		 
DateTime			 

ExpiryTime		 
{		 
get		 "
;		" #
set		$ '
;		' (
}		) *
} 
} ›
t/Users/abdulhadi.elhussain/Projects/AbdulhadiNagarroAssignment/AbdulhadiNagarroAssignment.Domain/Models/Statement.cs
	namespace 	&
AbdulhadiNagarroAssignment
 $
.$ %
Domain% +
.+ ,
Models, 2
{ 
public 

class 
	Statement 
: 
	BaseModel &
{ 
public 
virtual 
Account 
Account &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
int 
	AccountId 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
StatementDate #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public		 
string		 
Amount		 
{		 
get		 "
;		" #
set		$ '
;		' (
}		) *
}

 
} é	
o/Users/abdulhadi.elhussain/Projects/AbdulhadiNagarroAssignment/AbdulhadiNagarroAssignment.Domain/Models/User.cs
	namespace 	&
AbdulhadiNagarroAssignment
 $
.$ %
Domain% +
.+ ,
Models, 2
{ 
public 
class 
User 
: 
	BaseModel 
{ 
public 
string 
Username 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
EmailAddress "
{# $
get% (
;( )
set* -
;- .
}/ 0
public		 
string		 
DisplayName		 !
{		" #
get		$ '
;		' (
set		) ,
;		, -
}		. /
public

 
virtual

 
ICollection

 "
<

" #
UserRole

# +
>

+ ,
Roles

- 2
{

3 4
get

5 8
;

8 9
set

: =
;

= >
}

? @
} 
} —
s/Users/abdulhadi.elhussain/Projects/AbdulhadiNagarroAssignment/AbdulhadiNagarroAssignment.Domain/Models/UserRole.cs
	namespace 	&
AbdulhadiNagarroAssignment
 $
.$ %
Domain% +
.+ ,
Models, 2
{ 
public 
class 
UserRole 
: 
	BaseModel "
{ 
public 
virtual 
User 
User  
{! "
get# &
;& '
set( +
;+ ,
}- .
public		 
int		 
UserId		 
{		 
get		 
;		  
set		! $
;		$ %
}		& '
public

 
virtual

 
Role

 
Role

  
{

! "
get

# &
;

& '
set

( +
;

+ ,
}

- .
public 
int 
RoleId 
{ 
get 
;  
set! $
;$ %
}& '
} 
} 