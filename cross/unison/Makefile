PKG_NAME = unison
PKG_VERS = 2.40.102
PKG_EXT = tar.gz
PKG_DIST_NAME = $(PKG_NAME)-$(PKG_VERS).$(PKG_EXT)
PKG_DIST_SITE = http://www.seas.upenn.edu/~bcpierce/unison/download/releases/stable
PKG_DIR = $(PKG_NAME)-$(PKG_VERS)

DEPENDS = 

HOMEPAGE = http://www.cis.upenn.edu/~bcpierce/unison/
COMMENT  = Unison is a file-synchronization tool for Unix and Windows
LICENSE  = GNU Public License

GNU_CONFIGURE = 1
CONFIGURE_ARGS = CFLAGS='-gg $(TC_CFLAGS)'
CONFIGURE_TARGET = myConfigure

include ../../mk/spksrc.cross-cc.mk


.PHONY: myConfigure
myConfigure:

