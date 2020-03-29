load('//:buck_protobuf.bzl', 'WELL_KNOWN_PROTO_MAP')
load('//:buck_utils.bzl', 'subdir_glob')

macos_preprocessor_flags = [
  '-Wno-expansion-to-defined',
  '-DHAVE_PTHREAD=1',
]

linux_preprocessor_flags = [
  '-Wno-expansion-to-defined',
  '-DHAVE_PTHREAD=1',
]

linux_linker_flags = [
  '-pthread',
]

linux_compiler_flags = [
  '-pthread',
]

filegroup(
  name = 'well_known_protos',
  srcs = ['src/' + proto[1][0] for proto in WELL_KNOWN_PROTO_MAP.items()],
  visibility = [
    'PUBLIC',
  ],
)

cxx_library(
  name = 'protobuf',
  header_namespace = 'google',
  exported_headers = subdir_glob([
    ('src/google', 'protobuf/**/*.h'),
    ('src/google', 'protobuf/**/*.inc'),
  ], exclude = glob([
    'src/google/protobuf/testing/*.h',
    'src/google/protobuf/**/*_test*.h',
    'src/google/protobuf/**/*test_*.h',
    'src/google/protobuf/**/*unittest*.h',
    'src/google/protobuf/**/*mock*.h',
  ])),
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
  platform_linker_flags = [
    ('^linux.*', linux_linker_flags),
  ],
  platform_compiler_flags = [
    ('^linux.*', linux_compiler_flags),
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
  platform_linker_flags = [
    ('^linux.*', linux_linker_flags),
  ],
  platform_compiler_flags = [
    ('^linux.*', linux_compiler_flags),
  ],
  deps = [
    ':protobuf',
  ],
  visibility = [
    'PUBLIC',
  ],
)
