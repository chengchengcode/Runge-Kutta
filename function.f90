
	include 'include.f90'

	function func(x,y)
	use vars
	implicit none
	real*8	x,y(4)
	real*8	func(4)

	real*8		f1,f2,f3,f4
	external	f1,f2,f3,f4

	func(1)=-(1)!	x,y(1),y(2),y(3),y(4)
	func(2)=-(2)
	func(3)=-(3)
	func(4)=-(4)

	return
	end function func


	function f1(x,y)
	implicit none
	real*8	f1,x,y(4)
	
	f1=sin(x)

	return
	end function f1

	function f2(x,y)
	implicit none
	real*8	f2,x,y(4)
	
	f2=cos(x)

	return
	end function f2
	
	function f3(x,y)
	implicit none
	real*8	f3,x,y(4)
	
	f3=sin(x)!+cos(y(3))

	return
	end function f3

	function f4(x,y)
	implicit none
	real*8	f4,x,y(4)
	
	f4=cos(x)

	return
	end function f4

