#include "target_common.h"

FuncResult mock_target_func(uint32_t* __out)
{
    IS_NULL(__out)
    {
        *__out = 1;
        
        return FuncResultOk;
    }
    else
    {
        return FuncResultNg;
    }
}