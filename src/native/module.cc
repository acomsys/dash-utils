#include "module.h"
#include <string>
#include <iostream>

using namespace Napi;
using namespace std;

Napi::Object Init(Napi::Env env, Napi::Object exports)
{
    exports.Set(Napi::String::New(env, "hello"), Napi::Function::New(env, Method));
    std::string s = fmt::format("The answer is {}.", 42);
    cout << "String is  : " << s << endl;

    Napi::String name = Napi::String::New(env, "Greeter");
    exports.Set(name, Greeter::GetClass(env));
    return exports;
}

NODE_API_MODULE(dash_utils, Init)