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

#ifdef DK_ENABLE_ASSERTS
	#define DK_ASSERT(x, ...) { if(!(x)) { DK_ERROR("Assertion Failed: {0}", __VA_ARGS__); __debugbreak(); } }
	#define DK_CORE_ASSERT(x, ...) { if(!(x)) { DK_CORE_ERROR("Assertion Failed: {0}", __VA_ARGS__); __debugbreak(); } }
#else
	#define DK_ASSERT(x, ...)
	#define DK_CORE_ASSERT(x, ...)
#endif

#define BIT(x) (1 << x)