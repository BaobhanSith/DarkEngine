#pragma once

#ifdef DK_PLATFORM_WINDOWS

extern Dark::Application* Dark::CreateApplication();

int main(int argc, char** argv) {
	Dark::Log::Init();
	DK_CORE_WARN("Initialised Log!");
	int x = 5;
	DK_INFO("Hello! Var={0}", x);
	
	auto app = Dark::CreateApplication();
	app->Run();
	delete app;
}

#else
#error Dark Engine only supports Windows!
#endif