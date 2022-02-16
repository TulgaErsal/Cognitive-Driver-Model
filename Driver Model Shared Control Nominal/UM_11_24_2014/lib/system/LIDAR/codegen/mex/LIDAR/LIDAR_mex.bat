@echo off
set MATLAB=C:\PROGRA~1\MATLAB\R2013a
set MATLAB_ARCH=win64
set MATLAB_BIN="C:\Program Files\MATLAB\R2013a\bin"
set ENTRYPOINT=mexFunction
set OUTDIR=.\
set LIB_NAME=LIDAR
set MEX_NAME=LIDAR
set MEX_EXT=.mexw64
call mexopts.bat
echo # Make settings for LIDAR > LIDAR_mex.mki
echo COMPILER=%COMPILER%>> LIDAR_mex.mki
echo COMPFLAGS=%COMPFLAGS%>> LIDAR_mex.mki
echo OPTIMFLAGS=%OPTIMFLAGS%>> LIDAR_mex.mki
echo DEBUGFLAGS=%DEBUGFLAGS%>> LIDAR_mex.mki
echo LINKER=%LINKER%>> LIDAR_mex.mki
echo LINKFLAGS=%LINKFLAGS%>> LIDAR_mex.mki
echo LINKOPTIMFLAGS=%LINKOPTIMFLAGS%>> LIDAR_mex.mki
echo LINKDEBUGFLAGS=%LINKDEBUGFLAGS%>> LIDAR_mex.mki
echo MATLAB_ARCH=%MATLAB_ARCH%>> LIDAR_mex.mki
echo BORLAND=%BORLAND%>> LIDAR_mex.mki
echo OMPFLAGS= >> LIDAR_mex.mki
echo OMPLINKFLAGS= >> LIDAR_mex.mki
echo EMC_COMPILER=msvcsdk>> LIDAR_mex.mki
echo EMC_CONFIG=optim>> LIDAR_mex.mki
"C:\Program Files\MATLAB\R2013a\bin\win64\gmake" -B -f LIDAR_mex.mk
