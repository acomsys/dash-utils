#pragma once
#include <napi.h>

using namespace Napi;

class DashUtils : public Addon<DashUtils>{
    public:
    DashUtils(Env env, Object exports);

    Value Increment(const CallbackInfo& info);
    Value Decrement(const CallbackInfo& info);

    private:
    uint32_t n;
};