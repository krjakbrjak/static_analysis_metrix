#pragma once

namespace interfaces {
class IResource {
public:
  virtual void release() = 0;
};
} // namespace interfaces