
	include 'common.f90'

	program none
	use vars
	implicit none
	
	real*8	x_in,x_out,y0(4)

	x_out=10.
	x_in=2.0


	y0(1)=1
	y0(2)=-2
	y0(3)=3
	y0(4)=4
	
	write(*,*)y0

	call rk4(x_in,x_out,y0)
	
	end program none

	include 'subroutine.f90'


