{
    "targets": [

        {
            "target_name": "dash_utils",
            "sources": [
                "src/native/greeter/greeter.cc",
                "src/native/hello/hello.cc",
                "src/native/module.cc",
            ],
        },
    ],
    'target_defaults': {
        'include_dirs': ["<!(node -p \"require('node-addon-api').include_dir\")"],
        'dependencies': ["<!(node -p \"require('node-addon-api').gyp\")"],
        'cflags!': ['-fno-exceptions'],
        'cflags_cc!': ['-fno-exceptions'],
        'defines': ['NAPI_DISABLE_CPP_EXCEPTIONS.'],
        'conditions': [
            ["OS=='win'", {
                "defines": [
                    "_HAS_EXCEPTIONS=1"
                ],
                "msvs_settings": {
                    "VCCLCompilerTool": {
                        "ExceptionHandling": 1
                    },
                },
            }],
            ["OS=='mac'", {
                'xcode_settings': {
                    'GCC_ENABLE_CPP_EXCEPTIONS': 'YES',
                    'CLANG_CXX_LIBRARY': 'libc++',
                    'MACOSX_DEPLOYMENT_TARGET': '10.7',
                },
                'cflags+': ['-fvisibility=hidden'],
                'xcode_settings': {
                    'GCC_SYMBOLS_PRIVATE_EXTERN': 'YES',  # -fvisibility=hidden
                }
            }],
        ],
    },

}
