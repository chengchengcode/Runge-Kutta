
	include 'function.f90'

	subroutine rk4(x_in,x_out,y0)	
	use comm
	implicit none
	real*8	x,dydx,k1(4),k2(4),k3(4),k4(4)
	real*8	y(4),f(4),y_1(4),h,x_in,x_out,det_x
	real*8	x0,y0(4)
	real*8	n,A_KS,v_t,sigma_gas
	real(kind=8), external::rotation_vc

	integer*8	i

	real*8		f1,f2,f3,f4
	external	f1,f2,f3,f4

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
	write(*,*)'det_x',det_x

!	stop
	do i=1,N_step,1
	k1=func(x,y)
	k2=func(x+det_x/2.,y+det_x*k1/2.)
	k3=func(x+det_x/2.,y+det_x*k2/2.)
	k4=func(x+det_x/2.,y+det_x*k3)
	y_1=y+det_x*(k1+2*k2+2*k3+k4)/6.
	x=x-det_x
	y=y_1
	call disk_Rd    
	write(11,*)x,y(1)
	write(12,*)x,y(2)
	write(13,*)x,y(3)
	write(14,*)x,y(4)
	
	write(15,*)
	write(16,*)
	write(17,*)

	call flush(11)
	call flush(12)
	call flush(13)
	call flush(14)
	call flush(15)
	call flush(16)
	call flush(17)


	end do

	end subroutine rk4


