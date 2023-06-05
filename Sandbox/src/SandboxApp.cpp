#include <Dark.h>

class Sandbox : public Dark::Application {
public:
	Sandbox() {}
	~Sandbox() {}
};

Dark::Application* Dark::CreateApplication() {
	return new Sandbox();
}