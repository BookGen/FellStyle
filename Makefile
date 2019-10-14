# Creates links from `$srcdir/*.c[ls]s` to `Styles/*.c[ls]s`.
# Also links the associated python filter.
#
# Example usage from within another Makefile:
#
# 	fellstyle: ; $(MAKE) -f FellStyle/Makefile
# 	.PHONY: fellstyle

SHELL = /bin/sh
srcdir := $(patsubst %/Makefile,%,$(lastword $(MAKEFILE_LIST)))
fellclses := $(wildcard $(srcdir)/*.cls)
fellcsses := $(wildcard $(srcdir)/*.css)
fellsrcs := $(fellclses) $(fellcsses)
fellstyles := $(patsubst $(srcdir)/%,Styles/%,$(fellsrcs))
fellstylepys := $(patsubst $(srcdir)/%.cls,Styles/%.py,$(fellclses)) $(patsubst $(srcdir)/%.css,Styles/%.py,$(fellcsses))

fell: $(fellstyles) $(fellstylepys);
$(fellstyles): Styles/%: $(srcdir)/%; ln -fs "$(realpath $<)" $@
$(fellstylepys): $(srcdir)/FellStyle.py; ln -fs "$(realpath $<)" $@
clobber distclean gone: ; rm -f $(fellstyles) $(fellstylepys)
.PHONY: fell clobber distclean gone
