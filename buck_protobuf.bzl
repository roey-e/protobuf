"""Protobuf definitions for Buck."""

WELL_KNOWN_PROTO_MAP = {
  "any": ("google/protobuf/any.proto", []),
  "api": ("google/protobuf/api.proto", ["source_context", "type"]),
  "compiler_plugin": ("google/protobuf/compiler/plugin.proto", ["descriptor"]),
  "descriptor": ("google/protobuf/descriptor.proto", []),
  "duration": ("google/protobuf/duration.proto", []),
  "empty": ("google/protobuf/empty.proto", []),
  "field_mask": ("google/protobuf/field_mask.proto", []),
  "source_context": ("google/protobuf/source_context.proto", []),
  "struct": ("google/protobuf/struct.proto", []),
  "timestamp": ("google/protobuf/timestamp.proto", []),
  "type": ("google/protobuf/type.proto", ["any", "source_context"]),
  "wrappers": ("google/protobuf/wrappers.proto", []),
}
