# make makefile
#
# Tools used:
#  Compile::Resource Compiler
#  Compile::GNU C
#  Make: make
all : beehive.exe

.c.obj:
	icc -C -Q -Ti -Gm+ -Gd+ -Ge+ -G5 -Ss $<


beehive.exe : beehive.obj animate.obj blitgen.obj pcxload.obj beehive.def beehive.res
	ilink -NOL -O:beehive.exe -PM:PM -BASE:0x10000 -STACK:0x10000 -E:2 -MAP -DE -DB beehive.obj animate.obj blitgen.obj pcxload.obj mmpm2.lib beehive.def
	dllrname -n beehive.exe CPPOM30=OS2OM30
	rc -n -p -x2 beehive.res

beehive.obj : beehive.c beehive.h
animate.obj : animate.c
blitgen.obj : blitgen.c
pcxload.obj : pcxload.c

beehive.res : beehive.rc
	rc -n -r beehive.rc

clean :
	rm -rf *exe *res *obj *lib
