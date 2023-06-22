# make makefile
#
# Tools used:
#  Compile::Resource Compiler
#  Compile::GNU C
#  Make: make
all : beehive.exe

beehive.exe : beehive.obj animate.obj blitgen.obj pcxload.obj beehive.def beehive.res
	gcc -Zomf -g -o beehive.exe -L. -lmmpm2 beehive.obj animate.obj blitgen.obj pcxload.obj beehive.def
	wrc -q beehive.res

beehive.obj : beehive.c beehive.h
	gcc -Wall -Zomf -c -x c -g beehive.c -o beehive.obj

animate.obj : animate.c
	gcc -Wall -Zomf -c -x c -g animate.c -o animate.obj

blitgen.obj : blitgen.c
	gcc -Wall -Zomf -c -x c -g blitgen.c -o blitgen.obj

pcxload.obj : pcxload.c
	gcc -Wall -Zomf -c -x c -g pcxload.c -o pcxload.obj

beehive.res : beehive.rc
	wrc -q -r -bt=os2 beehive.rc

clean :
	rm -rf *exe *res *obj *lib
