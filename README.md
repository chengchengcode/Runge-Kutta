# Runge-Kutta
RK4 fortran code

用法
-----
在function.f90里的func(1),func(2),func(3),func(4)里输入以x，y1,y2,y3,y4 为自变量的函数

解出来的是dyi/dx=func（i）,i=1,2,3,4，的微分方程

在EVA.f90里的	

是外边界
	x_out=10.

可以写内边界，也可以不写，让她自动往后算
	x_in=2.0
写入初值比如：
	y0(1)=1
	y0(2)=-2
	y0(3)=3
	y0(4)=4

然后就能解了

我这里写的是从外往里解的，因为星系外边界好订一些
