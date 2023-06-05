#pragma once

#ifdef DK_PLATFORM_WINDOWS

extern Dark::Application* Dark::CreateApplication();

void main(int argc, char** argv) {
	printf("Dark Engine\n");
	auto app = Dark::CreateApplication();
	app->Run();
	delete app;
}

#else
#error Dark Engine only supports Windows!
#endif