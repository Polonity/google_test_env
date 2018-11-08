ROOTDIR=.

TARGET=ut_builded

# ---------------------------------------------------------------------
# Test Target
# ---------------------------------------------------------------------
TEST_TARGET_DIR=$(ROOTDIR)/test-target
TEST_TARGET_LIBDIR=$(TEST_TARGET_DIR)/lib
TEST_TARGET_LIB=test_target
TEST_TARGET_LIB_FILE=libtest_target.a

SRC_SUFFIX=cpp

TEST_CODE_DIR=$(ROOTDIR)/test-code

SRCDIR=$(TEST_CODE_DIR)/src
SRCS=$(wildcard $(SRCDIR)/*.$(SRC_SUFFIX))

OBJDIR=$(TEST_CODE_DIR)/obj
OBJS=$(patsubst $(SRCDIR)/%.$(SRC_SUFFIX),$(OBJDIR)/%.o,$(SRCS))

BINDIR=$(ROOTDIR)/bin
BINS=$(patsubst $(SRCDIR)/%.$(SRC_SUFFIX),$(BINDIR)/%,$(SRCS))

# ---------------------------------------------------------------------
# google test settings
# ---------------------------------------------------------------------
GOOGLE_TEST_ROOT=$(ROOTDIR)/googletest

GOOGLE_TEST_LIBDIR=$(GOOGLE_TEST_ROOT)/lib
GOOGLE_TEST_LIB=gtest
GOOGLE_TEST_MAIN_LIB=gtest_main
GOOGLE_MOCK_LIB=gmock

GOOGLE_TEST_DIR=$(GOOGLE_TEST_ROOT)/googletest
GOOGLE_TEST_INCDIR=$(GOOGLE_TEST_DIR)/include

GOOGLE_MOCK_DIR=$(GOOGLE_TEST_ROOT)/googlemock
GOOGLE_MOCK_INCDIR=$(GOOGLE_MOCK_DIR)/include

# ---------------------------------------------------------------------

INCDIR= \
	-I$(TEST_CODE_DIR)/inc \
	-I$(TEST_TARGET_DIR)/inc \
	-I$(TEST_TARGET_DIR)/src \
	-I$(GOOGLE_TEST_INCDIR) \
	-I$(GOOGLE_MOCK_INCDIR)

DEFINE=

PROFILE= -coverage

CFLAGS= $(DEFINE) $(INCDIR) $(PROFILE)
CXXFLAGS= $(CFLAGS) -std=c++11

LDFLAGS= -L$(TEST_TARGET_LIBDIR) -L$(GOOGLE_TEST_LIBDIR)
LIBS= -l$(TEST_TARGET_LIB) -l$(GOOGLE_TEST_LIB) -l$(GOOGLE_MOCK_LIB) -l$(GOOGLE_TEST_MAIN_LIB) -lpthread

# ---------------------------------------------------------------------
CC=gcc
CXX=g++
AR=ar
MKDIR=mkdir
TOUCH=touch
MAKE=make
CD=cd
RM=rm

# ---------------------------------------------------------------------

all: $(TARGET)

$(TARGET): $(TEST_TARGET_LIBDIR)/$(TEST_TARGET_LIB_FILE) $(BINDIR) $(BINS)
	$(TOUCH) $@

$(BINDIR)/%: $(OBJDIR)/%.o
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)

$(OBJDIR)/%.o: $(SRCDIR)/%.$(SRC_SUFFIX)
	$(CXX) $(CXXFLAGS) -c -o $@ $^

$(BINDIR):
	$(MKDIR) -p $@
	
$(OBJDIR):
	$(MKDIR) -p $@

$(TEST_TARGET_LIBDIR)/$(TEST_TARGET_LIB_FILE):
	$(CD) $(TEST_TARGET_DIR) && $(MAKE) all
	

# ---------------------------------------------------------------------

clean: 
	$(CD) $(TEST_TARGET_DIR) && $(MAKE) clean
	$(RM) -f $(BINS) $(OBJS) $(TARGET)