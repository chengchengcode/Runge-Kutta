	module rk4_step
	implicit none
	integer*8		::	N_step=10000
	end module rk4_step

	program none
	use rk4_step
	implicit none
	call rk4_boundry()
	end program none

!	被解方程形式：	
!			dy1/dx=f1(x,y1,y2,y3,y4)
!			dy2/dx=f2(x,y1,y2,y3,y4)
!			dy3/dx=f3(x,y1,y2,y3,y4)
!			dy4/dx=f4(x,y1,y2,y3,y4)
!
!	程序中定义数组y(4)=(y1,y2,y3,y4)
!	边界在x_in,x_out之间，外边界处y值写在y0(4)中，这些赋值由subroutine rk4_boundry()完成
!	程序中定义函数组func(4),在function func(x,y)中定义，后用interface引入龙格库塔计算过程
!	
!	子过程：龙格裤衩程序边界条件
	subroutine rk4_boundry()
	implicit none
	real*8	x_in,x_out,y0(4)
!	内外边界
	x_out=10.
	x_in=2.0
!	y0(i),外边界处的初值
	y0(1)=1
	y0(2)=-2
	y0(3)=3
	y0(4)=4
!	write(*,*)y0
	call rk4(x_in,x_out,y0)
	return
	end subroutine rk4_boundry

!	方程组右边，函数表达式
	function func(x,y)
!	use rk4_step
	implicit none
	real*8	x,y(4)
	real*8	func(4)
	real*8,external	::	f1,f2,f3,f4
!	等号右边写函数表达式，都是x,y(1),y(2),y(3),y(4)的函数
!	或者等于f1,f2,f3,f4，并另外定义
	func(1)=-(1)!	x,y(1),y(2),y(3),y(4)
	func(2)=-(2)
	func(3)=-(3)
	func(4)=-(4)
	return
	end function func

!	龙格库塔过程
	subroutine rk4(x_in,x_out,y0)	
	use rk4_step
	implicit none
	integer*8	::	i
	real*8	::	x,dydx,k1(4),k2(4),k3(4),k4(4)
	real*8	::	y(4),f(4),y_1(4),h,x_in,x_out,det_x
	real*8	::	x0,y0(4)
	real*8,external	::	f1,f2,f3,f4

	interface
		function func(x,y)
		implicit none
		real*8	x,y(4)
		real*8	func(4)
		end function
	end interface

	y=y0
	x=x_out
	det_x=(x_out-x_in)/N_step
	write(*,*)'x_in=',x_in,'x_out=',x_out
	write(*,*)'det_x=',det_x

!	stop
	do i=1,N_step,1
	k1=func(x,y)
	k2=func(x+det_x/2.,y+det_x*k1/2.)
	k3=func(x+det_x/2.,y+det_x*k2/2.)
	k4=func(x+det_x/2.,y+det_x*k3)
	y_1=y+det_x*(k1+2*k2+2*k3+k4)/6.
	x=x-det_x
	y=y_1

	write(11,*)x,y(1)
	write(12,*)x,y(2)
	write(13,*)x,y(3)
	write(14,*)x,y(4)
!	write(15,*)
!	write(16,*)
!	write(17,*)

	call flush(11)
	call flush(12)
	call flush(13)
	call flush(14)
!	call flush(15)
!	call flush(16)
!	call flush(17)

	end do

	end subroutine rk4
!!________________________________________________

!	自定义函数
	function f1(x,y)
	implicit none
	real*8	f1,x,y(4)
!	x,y(1),y(2),y(3),y(4)的函数
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



