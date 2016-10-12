	module comm
	implicit none

	real*8,parameter	::	pi=3.1415926
	real*8,parameter	::	pc=3.08d18
	real*8,parameter	::	M_sun=1.98d33
	real*8,parameter	::	G=6.67d-8
	real*8,parameter	::	m_H=1.67d-24
	real*8,parameter	::	yr=3.15d7

	integer*8		::	N_step=10000

	real*8			::	E_sn=1.d51
	real*8			::	eps=0.1
	real*8			::	f_sn=8.4328d-36

	real*8			::	gamma_KS=1.4
!	real*8			::	A_KS=
	end module comm

