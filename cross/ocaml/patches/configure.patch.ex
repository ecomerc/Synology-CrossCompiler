--- configure.old	2014-09-24 20:59:13.044094501 +0200
+++ configure	2014-09-24 20:59:34.048094501 +0200
@@ -16,12 +16,13 @@
 # $Id: configure 10636 2010-07-28 13:18:22Z doligez $
 
 configure_options="$*"
-prefix=/usr/local
+prefix=/opt/cross/arm
 bindir=''
 libdir=''
 mandir=''
 manext=1
-host_type=unknown
+host_type=arm-linux
+cross=arm-linux-gnueabi-
 ccoption=''
 asoption=''
 asppoption=''
@@ -57,6 +58,8 @@
     "") break;;
     -prefix|--prefix)
         prefix=$2; shift;;
+    -cross)
+        cross="$2"; shift;;
     -bindir|--bindir)
         bindir=$2; shift;;
     -libdir|--libdir)
@@ -1249,6 +1252,8 @@
 x11_include="not found"
 x11_link="not found"
 
+if false; then  # skip X11
+
 for dir in \
     $x11_include_dir          \
                               \
@@ -1371,6 +1376,7 @@
   fi
 done
 
+fi # end skip X11
 
 if test "$x11_include" = "not found" || test "$x11_link" = "not found"
 then
@@ -1395,6 +1401,8 @@
 dbm_link="not found"
 use_gdbm_ndbm=no
 
+if false; then  # skip dbm
+
 for dir in /usr/include /usr/include/db1 /usr/include/gdbm; do
   if test -f $dir/ndbm.h; then
     dbm_include=$dir
@@ -1420,6 +1428,9 @@
     break
   fi
 done
+
+fi # end skip dbm
+
 if test "$dbm_include" = "not found" || test "$dbm_link" = "not found"; then
   echo "NDBM not found, the \"dbm\" library will not be supported."
 else
@@ -1593,6 +1604,7 @@
 
 cclibs="$cclibs $mathlib"
 
+echo "CROSS=$cross" >> Makefile
 echo "BYTECC=$bytecc" >> Makefile
 echo "BYTECCCOMPOPTS=$bytecccompopts" >> Makefile
 echo "BYTECCLINKOPTS=$bytecclinkopts" >> Makefile
@@ -1614,14 +1626,14 @@
 echo "ARCH=$arch" >> Makefile
 echo "MODEL=$model" >> Makefile
 echo "SYSTEM=$system" >> Makefile
-echo "NATIVECC=$nativecc" >> Makefile
+echo "NATIVECC=$cross$nativecc" >> Makefile
 echo "NATIVECCCOMPOPTS=$nativecccompopts" >> Makefile
 echo "NATIVECCPROFOPTS=$nativeccprofopts" >> Makefile
 echo "NATIVECCLINKOPTS=$nativecclinkopts" >> Makefile
 echo "NATIVECCRPATH=$nativeccrpath" >> Makefile
 echo "NATIVECCLIBS=$cclibs $dllib" >> Makefile
-echo "ASM=$as" >> Makefile
-echo "ASPP=$aspp" >> Makefile
+echo "ASM=$cross$as" >> Makefile
+echo "ASPP=$cross$aspp" >> Makefile
 echo "ASPPPROFFLAGS=$asppprofflags" >> Makefile
 echo "PROFILING=$profiling" >> Makefile
 echo "DYNLINKOPTS=$dllib" >> Makefile
@@ -1629,7 +1641,7 @@
 echo "DEBUGGER=$debugger" >> Makefile
 echo "CC_PROFILE=$cc_profile" >> Makefile
 echo "SYSTHREAD_SUPPORT=$systhread_support" >> Makefile
-echo "PARTIALLD=$partialld" >> Makefile
+echo "PARTIALLD=$cross$partialld" >> Makefile
 echo "PACKLD=\$(PARTIALLD) \$(NATIVECCLINKOPTS) -o " \
   | sed -e 's/ $/\\ /' >> Makefile
 echo "DLLCCCOMPOPTS=$dllccompopts" >> Makefile
@@ -1646,9 +1658,9 @@
 echo "TOOLCHAIN=cc" >> Makefile
 echo "NATDYNLINK=$natdynlink" >> Makefile
 echo "CMXS=$cmxs" >> Makefile
-echo "MKEXE=$mkexe" >> Makefile
-echo "MKDLL=$mksharedlib" >> Makefile
-echo "MKMAINDLL=$mkmaindll" >> Makefile
+echo "MKEXE=$cross$mkexe" >> Makefile
+echo "MKDLL=$cross$mksharedlib" >> Makefile
+echo "MKMAINDLL=$cross$mkmaindll" >> Makefile
 
 rm -f tst hasgot.c
 rm -f ../m.h ../s.h ../Makefile
