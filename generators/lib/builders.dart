// ignore: unnecessary_library_directive
// ignore_for_file: require_trailing_commas

import 'package:build/build.dart';

import 'package:generators/src/enum_pattern_matching_generator.dart';
import 'package:generators/src/unit_test_generator.dart';
import 'package:source_gen/source_gen.dart';

Builder steroidsBuilder(BuilderOptions options) => SharedPartBuilder([EnumPatternMatchingGenerator()], 'steroids');

Builder unitTestBuilder(BuilderOptions options) {
  return LibraryBuilder(
    UnitTestGenerator(),
    generatedExtension: '.test.dart',
  );
}
