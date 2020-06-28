#include <interfaces/iresource.h>
#include <iostream>
#include <memory>

class Dummy: public interfaces::IResource
{
    public:
    void virtual release() override final
    {
        std::cout << __FUNCTION__ << std::endl;
    }
};

int main(int argc, char **argv)
{
    using namespace interfaces;
    std::unique_ptr<IResource> resource = std::make_unique<Dummy>();
    resource->release();
    return 0;
}