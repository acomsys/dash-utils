#include "module.h"

using namespace Napi;

Napi::Object Init(Napi::Env env, Napi::Object exports)
{
    exports.Set(Napi::String::New(env, "hello"), Napi::Function::New(env, Method));

    Napi::String name = Napi::String::New(env, "Greeter");
    exports.Set(name, Greeter::GetClass(env));
    return exports;
}

NODE_API_MODULE(dash_utils, Init)