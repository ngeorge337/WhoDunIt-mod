 @echo off
 set ProjName=WDI
 echo Ready to Start.
 echo Step 1: Compile ACS Libraries
 acc pk3\acs\LIB.acs

 if not exist pk3\acs\acs.err goto 20
 pause
 exit

 :20
 echo Compiled and replaced
 echo Step 2: Packing
 echo Packing...
 cd pk3
 ..\7z a -r -ssw -tzip ..\%ProjName%n.pk3 *.txt *.o *.png *.wad *.md2 *.md3 *.tga *.acs *.mp3 *.pal *.bmp *.map
 echo Done packing.
 cd ..
 echo Step 4: Replace old version
 echo Replacing old version.
 del %ProjName%.pk3
 ren %ProjName%n.pk3 %ProjName%.pk3
 echo Done replacing.
 echo Done.
 pause
