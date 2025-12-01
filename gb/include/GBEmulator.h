#pragma once

#if defined(OS_WINDOWS)
    #if defined(GBEMULATOR_EXPORTS)
        #define GB_API __declspec(dllexport)
    #else
        #define GB_API __declspec(dllimport)
    #endif
#else
    #define GB_API
#endif