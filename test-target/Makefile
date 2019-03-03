ROOTDIR=.

TARGET=libtest_target.a

LIBDIR=$(ROOTDIR)/lib

SRC_SUFFIX=c


SRCDIR=$(ROOTDIR)/src
SRCS=$(wildcard $(SRCDIR)/*.$(SRC_SUFFIX))

OBJDIR=$(ROOTDIR)/obj
OBJS=$(patsubst $(SRCDIR)/%.$(SRC_SUFFIX),$(OBJDIR)/%.o,$(SRCS))

INCDIR= \
	-I$(ROOTDIR)/inc

DEFINE=

PROFILE= -coverage

CFLAGS= $(DEFINE) $(INCDIR) $(PROFILE)

# ---------------------------------------------------------------------
CC=gcc
AR=ar
MKDIR=mkdir
RM=rm
# ---------------------------------------------------------------------

all: $(TARGET)

$(TARGET): $(LIBDIR) $(OBJDIR) $(OBJS)
	$(AR) rcs $(LIBDIR)/$@ $(OBJS)

$(OBJDIR)/%.o: $(SRCDIR)/%.$(SRC_SUFFIX)
	pwd
	$(CC) $(CFLAGS) -c -o $@ $^

$(LIBDIR):
	$(MKDIR) -p $@
	
$(OBJDIR):
	$(MKDIR) -p $@

clean:
	$(RM) -f $(LIBDIR)/$(TARGET) $(OBJDIR)/*
