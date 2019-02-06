load('//:subdir_glob.bzl', 'subdir_glob')

macos_preprocessor_flags = [
  '-Wno-expansion-to-defined',
  '-DHAVE_PTHREAD=1',
]

linux_preprocessor_flags = [
  '-Wno-expansion-to-defined',
  '-DHAVE_PTHREAD=1',
]

genrule(
  name = 'config-h',
  out = 'config.h',
  cmd = 'touch $OUT',
)

prebuilt_cxx_library(
  name = 'pthread',
  header_only = True,
  exported_linker_flags = [
    '-lpthread',
  ],
)

cxx_library(
  name = 'protobuf',
  header_namespace = '',
  exported_headers = subdir_glob([
    ('src', 'google/protobuf/**/*.h'),
    ('src', 'google/protobuf/**/*.inc'),
  ], exclude = glob([
    'src/google/protobuf/**/*_test*.h',
    'src/google/protobuf/**/*test_*.h',
    'src/google/protobuf/**/*unittest*.h',
    'src/google/protobuf/**/*mock*.h',
  ])),
  headers = {
    'config.h': ':config-h',
  },
  srcs = glob([
    'src/google/protobuf/**/*.cc',
  ], exclude = glob([
    'src/google/protobuf/compiler/main.cc',
    'src/google/protobuf/compiler/js/embed.cc',
    'src/google/protobuf/testing/**/*.cc',
    'src/google/protobuf/**/*_test*.cc',
    'src/google/protobuf/**/*test_*.cc',
    'src/google/protobuf/**/*unittest*.cc',
    'src/google/protobuf/**/*mock*.cc',
  ])),
  platform_preprocessor_flags  = [
    ('^macos.*', macos_preprocessor_flags),
    ('^linux.*', linux_preprocessor_flags),
    ('default', linux_preprocessor_flags),
  ],
  platform_deps = [
    ('^linux.*', [ ':pthread' ]),
  ],
  visibility = [
    'PUBLIC',
  ],
)

cxx_binary(
  name = 'protoc',
  srcs = [
    'src/google/protobuf/compiler/main.cc',
  ],
  preprocessor_flags = [
    '-DOPENSOURCE_PROTOBUF_CPP_BOOTSTRAP=1',
  ],
  platform_preprocessor_flags = [
    ('^macos.*', [ '-Wno-expansion-to-defined' ]),
    ('^linux.*', [ '-Wno-expansion-to-defined' ]),
    ('default', [ '-Wno-expansion-to-defined' ]),
  ],
  deps = [
    ':protobuf',
  ],
  visibility = [
    'PUBLIC',
  ],
)
