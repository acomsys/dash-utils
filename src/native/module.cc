#include "module.h"

using namespace Napi;

DashUtils::DashUtils(Env env, Object exports)
{
    n = 40;
    auto increment = InstanceMethod("increment", &DashUtils::Increment);
    auto decrement = InstanceMethod("decrement", &DashUtils::Decrement);
    auto subobjectProp = DefineProperties(Object::New(env), {decrement});
    auto subobject = InstanceValue("subobject", subobjectProp, napi_enumerable);

    DefineAddon(exports, {increment, subobject});
}

Value DashUtils::Increment(const CallbackInfo &info)
{
    return Number::New(info.Env(), ++n);
}

Value DashUtils::Decrement(const CallbackInfo &info)
{
    return Number::New(info.Env(), --n);
}

NODE_API_ADDON(DashUtils);