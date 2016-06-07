  @echo off
 set ProjName=WhoDunIt
 for /f "tokens=2" %%i in ('svn info -rHEAD https://76.186.91.72:25565/svn/WhoDunIt_Classic/^|find "Revision"') do set versionnum=%%i
 echo Ready to Start.



 echo Step 1: Compiling ACS Scripts
 echo Compiling...
 cd .\src
 ..\Compiler\acc.exe .\core\redrum.acs
 ..\Compiler\acc.exe .\classic.acs


 if not exist acs.err goto 9
 echo Errors compiling ACS scripts. Please check acs.err for a log.
 pause
 exit

 :9
 if not exist .\core\acs.err goto 10
 echo Errors compiling ACS scripts. Please check acs.err for a log.
 pause
 exit

 :10
 cd..
 echo .
 echo .
 echo .
 echo Done Compiling.
 echo .
 echo .
 echo .






 echo Step 2: Moving Compiled ACS Scripts
 echo Moving...
 cd .\src
 move .\core\redrum.o ..\pk3\ACS\redrum.o
 move .\classic.o ..\pk3\ACS\classic.o
 cd..
 echo .
 echo .
 echo .
 echo Done Moving.
 echo .
 echo .
 echo .




 echo Step 3: Packing
 echo Packing...
 cd .\pk3
 ..\Compiler\7z a -r -ssw -mmt -tzip ..\%ProjName%n.pk3 *.txt *.o *.png *.wad *.md2 *.md3 *.bmp *.tga *.acs *.wav *.lmp *.raw *.mp3 *.ogg *.wad *.pk3
 cd ..
 echo .
 echo .
 echo .
 echo Done Packing.
 echo .
 echo .
 echo .





 echo Step 4: Replace old version
 echo Replacing old version.
 ren %ProjName%n.pk3 %ProjName%n.pk5
 del *.pk3
 ren %ProjName%n.pk5 %ProjName%n.pk3
 ren %ProjName%n.pk3 %ProjName%r%versionnum%.pk3
 echo Done replacing.
 echo .
 echo .
 echo .
 echo .
 echo .
 echo Done.
 pause

