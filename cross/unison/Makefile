PKG_NAME = unison
PKG_VERS = 2.40.102
PKG_EXT = tar.gz
PKG_DIST_NAME = $(PKG_NAME)-$(PKG_VERS).$(PKG_EXT)
PKG_DIST_SITE = http://www.seas.upenn.edu/~bcpierce/unison/download/releases/stable
PKG_DIR = $(PKG_NAME)-$(PKG_VERS)

DEPENDS = cross/ocaml

HOMEPAGE = http://www.cis.upenn.edu/~bcpierce/unison/
COMMENT  = Unison is a file-synchronization tool for Unix and Windows
LICENSE  = GNU Public License

CONFIGURE_ARGS = 
CONFIGURE_TARGET = myConfigure
COMPILE_TARGET = myCompile
INSTALL_TARGET = myInstall

include ../../mk/spksrc.cross-cc.mk


.PHONY: myConfigure
myConfigure:
LD_LIBRARY_PATH=/home/peter/syno/spksrc-unison/cross/ocaml/work-armadaxp/install/usr/local/lib/ocaml/stublibs/


.PHONY: myCompile
myCompile:
	$(RUN) PATH=$(INSTALL_DIR)/usr/local/bin/:$(PATH) CFLAGS="-ccopt '$(CFLAGS)'" make UISTYLE=TEXT NATIVE=false STATIC=true


.PHONY: myInstall
myInstall:
