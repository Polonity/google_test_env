#include "mock_target.h"

FuncResult test_target_func(bool shouldFuncCall, uint32_t* __out)
{
    IS_NULL(__out)
    {
        return FuncResultNg;
    }

    if(shouldFuncCall)
    {
        mock_target_func(__out);
        return FuncResultOk;
    }
    else
    {
        *__out = 0x0;
        return FuncResultNg;
    }
    //here is does not pass
}