PKG_NAME = ocaml
PKG_VERS = 3.12.0
PKG_EXT = tar.gz
PKG_DIST_NAME = $(PKG_NAME)-$(PKG_VERS).$(PKG_EXT)
PKG_DIST_SITE = http://caml.inria.fr/pub/distrib/ocaml-3.12/
PKG_DIR = $(PKG_NAME)-$(PKG_VERS)

#THIS IS ONLY A CROSS COMPILER PACKAGE NOT AN ACTUAL PACKAGE FOR DISTRIBUTION

DEPENDS = 

HOMEPAGE = http://caml.inria.fr/
COMMENT  = Caml is a general-purpose programming language, designed with program safety and reliability in mind
LICENSE  = GNU Public License


CONFIGURE_ARGS = -verbose -prefix $(TC_PATH) -bindir $(INSTALL_DIR)/usr/local/bin -libdir $(INSTALL_DIR)/usr/local/lib/ocaml -mandir $(INSTALL_DIR)/usr/local/man/manl -host $(TC_TARGET) -cc $(TC_PREFIX)gcc -as $(TC_PREFIX)as -aspp "$(TC_PREFIX)gcc -E" -partialld "$(TC_PREFIX)ld -r"

INSTALL_TARGET = myInstall
COMPILE_TARGET = myCompile

include ../../mk/spksrc.cross-cc.mk


.PHONY: myConfig
myConfig:


.PHONY: myCompile
myCompile:
	# First run create ocamlrun
	$(RUN) $(MAKE) world || true
	mv $(WORK_DIR)/$(PKG_DIR)/byterun/ocamlrun $(WORK_DIR)/ocamlrun.target
	cp /usr/bin/ocamlrun $(WORK_DIR)/$(PKG_DIR)/byterun/
	cp /usr/bin/ocamlrun $(WORK_DIR)/$(PKG_DIR)/boot/
	# Second: ocamlyacc
	$(RUN) $(MAKE) world || true
	mv $(WORK_DIR)/$(PKG_DIR)/yacc/ocamlyacc $(WORK_DIR)/ocamlyacc.target
	cp /usr/bin/ocamlyacc $(WORK_DIR)/$(PKG_DIR)/yacc/
	cp /usr/bin/ocamlyacc $(WORK_DIR)/$(PKG_DIR)/boot/
	# Third: dllunix.so
	$(RUN) $(MAKE) world || true	
	mv $(WORK_DIR)/$(PKG_DIR)/otherlibs/unix/dllunix.so $(WORK_DIR)/dllunix.so.target
	cp /usr/lib/ocaml/stublibs/dllunix.so $(WORK_DIR)/$(PKG_DIR)/otherlibs/unix/
	# Fourth: dllcamlstr.so
	$(RUN) $(MAKE) world || true	
	mv $(WORK_DIR)/$(PKG_DIR)/otherlibs/str/dllcamlstr.so $(WORK_DIR)/dllcamlstr.so.target
	cp /usr/lib/ocaml/stublibs/dllcamlstr.so $(WORK_DIR)/$(PKG_DIR)/otherlibs/str/
	# Fift: Everything
	$(RUN) $(MAKE) world 
	@echo "!!!!!!!!!!!!!!!!!!!"
	@echo $(INSTALL_DIR)
	$(RUN) $(MAKE) ARCH=arm opt

.PHONY: myInstall
myInstall:
	$(RUN) $(MAKE) install DESTDIR=$(INSTALL_DIR)

