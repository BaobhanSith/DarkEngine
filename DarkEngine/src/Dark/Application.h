#pragma once

#include "Core.h"

namespace Dark {
	class DARK_API Application
	{
	public:
		Application();
		virtual ~Application();
		void Run();
	};

	//To be defined in CLIENT
	Application* CreateApplication();
}
