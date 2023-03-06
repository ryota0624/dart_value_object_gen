/// Support for doing something awesome.
///
/// More dartdocs go here.
library value_object_gen;

import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:value_object_gen/src/value_object_gen.dart';
import 'package:value_object_gen/src/value_object_gen_2.dart';

export 'src/value_object_gen.dart';
export 'src/value_object_gen_2.dart';

Builder valueObjectBuilder(BuilderOptions options) {
  return SharedPartBuilder([
    ValueObjectGenerator(),
    ValueObject2Generator(),
  ], 'value_object');
}
