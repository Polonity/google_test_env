
#ifndef __TARGET_COMMON__
#define __TARGET_COMMON__

#include "stdio.h"


#ifndef __cplusplus
typedef unsigned char       uint8_t;
typedef unsigned short      uint16_t;
typedef unsigned int        uint32_t;
typedef char                int8_t;
typedef short               int16_t;
typedef int                 int32_t;
typedef uint8_t             bool;
#endif

typedef enum
{
    FuncResultOk = 0x10000,
    FuncResultNg,
} FuncResult;

#define IS_NULL(ptr)    if(ptr==NULL)

#endif // __TARGET_COMMON__