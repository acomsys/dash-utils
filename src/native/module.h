#pragma once

#include "napi.h"
#include "hello/hello.h"
#include "greeter/greeter.h"

Napi::Object Init(Napi::Env env, Napi::Object exports);