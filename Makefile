ATDGEN_SOURCES = src/types.atd
ATDGEN = atdgen  
ATDGEN_FLAGS = -j-std -j-custom-fields \
	"(fun a b -> Printf.printf \"Unknown field: %s\\t(%s)\\n\" b a)"	

RUN_ATDGEN:=$(shell $(ATDGEN) $(ATDGEN_FLAGS) $(ATDGEN_SOURCES))

# OASIS_START
# DO NOT EDIT (digest: 7b2408909643717852b95f994b273fee)

SETUP = ocaml setup.ml

build: setup.data
	$(SETUP) -build $(BUILDFLAGS)

doc: setup.data build
	$(SETUP) -doc $(DOCFLAGS)

test: setup.data build
	$(SETUP) -test $(TESTFLAGS)

all:
	$(SETUP) -all $(ALLFLAGS)

install: setup.data
	$(SETUP) -install $(INSTALLFLAGS)

uninstall: setup.data
	$(SETUP) -uninstall $(UNINSTALLFLAGS)

reinstall: setup.data
	$(SETUP) -reinstall $(REINSTALLFLAGS)

clean:
	$(SETUP) -clean $(CLEANFLAGS)

distclean:
	$(SETUP) -distclean $(DISTCLEANFLAGS)

setup.data:
	$(SETUP) -configure $(CONFIGUREFLAGS)

.PHONY: build doc test all install uninstall reinstall clean distclean configure

# OASIS_STOP

opam-release:
	$(eval NAME:=$(shell oasis query name))
	$(eval VERSION:=$(shell oasis query version))
	$(eval PACKAGE:=$(NAME).$(VERSION))
	$(eval DIR:=releases/$(PACKAGE))
	mkdir -p $(DIR)
	tar -cjf $(DIR)/$(PACKAGE).tar.bz2 \
		--transform 's,^\.,$(PACKAGE),' \
		--exclude=_build --exclude=releases .
	cp opam/descr $(DIR)
	md5sum $(DIR)/$(PACKAGE).tar.bz2 | sed -e 's/\(\S*\)\s*.*$$/\1/' > $(DIR)/$(PACKAGE).md5
	$(eval MD5=`cat $(DIR)/$(PACKAGE).md5`)
	@echo $(MD5)
	export MD5=$(MD5) && cat opam/url | \
		sed -e 's/%package%/$(PACKAGE).tar.bz2/' \
		-e "s/%checksum%/$(MD5)/" \
		> $(DIR)/url
	cat opam/opam > $(DIR)/opam


	

