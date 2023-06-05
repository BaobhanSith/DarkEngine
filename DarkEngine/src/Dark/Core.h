#pragma once

#ifdef DK_PLATFORM_WINDOWS
	#ifdef DK_BUILD_DLL
		#define DARK_API __declspec(dllexport)
	#else
		#define DARK_API __declspec(dllimport)
	#endif
#else
	#error Dark Engine only supports Windows!
#endif