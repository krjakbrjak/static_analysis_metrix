#pragma once

namespace interfaces
{
class IResource
{
    public:
    virtual void release() = 0;
};
}