#include "hello.h"

using namespace Napi;

Napi::String HelloMethod(const Napi::CallbackInfo &info)
{
  Napi::Env env = info.Env();
  return Napi::String::New(env, "world");
}
