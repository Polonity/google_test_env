#include "gtest/gtest.h"
#include "gmock/gmock.h"

using ::testing::_;


#define mock_target_func mock_target_func_hook
extern "C"{
#include "test_target.c"
}
#undef mock_target_func



// ------------------------------------------------------------------------------------
// Mock class
// ------------------------------------------------------------------------------------
class MockTarget
{
public:
    MOCK_METHOD1(mock_target_func, FuncResult(uint32_t* __out));
};

MockTarget* pMockTarget = NULL;

FuncResult mock_target_func_hook(uint32_t* __out)
{
    pMockTarget->mock_target_func(__out);
}

// ------------------------------------------------------------------------------------
// Test class
// ------------------------------------------------------------------------------------
class TestClass : public ::testing::Test 
{
protected:

    MockTarget mockTarget;

    virtual void SetUp() { pMockTarget = &mockTarget;}

    virtual void TearDown() { pMockTarget = NULL;}

};

// ------------------------------------------------------------------------------------
// Test code
// ------------------------------------------------------------------------------------
TEST_F(TestClass, TestCaseName)
{
    uint32_t __out;
    uint32_t* __pout = &__out;
    EXPECT_CALL(mockTarget, mock_target_func(_))              // #3
        .Times(1);

    EXPECT_EQ(FuncResultOk, test_target_func(0==0, __pout));
}
