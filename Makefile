#
# Makefile for installation
#


# Transform the GVIM syntax folder to Cygwin path
GVIM_DEST :=$(shell cygpath --unix "$(USERPROFILE)/vimfiles/syntax/")

install:
	cp atmel_xcfg.vim ~/.vim/syntax/
	cp atmel_xcfg.vim $(GVIM_DEST)

