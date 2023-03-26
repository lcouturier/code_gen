// ignore: unnecessary_library_directive
// ignore_for_file: require_trailing_commas

library generators;

import 'package:build/build.dart';

import 'package:generators/src/enum_when_generator.dart';
import 'package:source_gen/source_gen.dart';

Builder steroidsGenerator(BuilderOptions options) => SharedPartBuilder([EnumWhenGenerator()], 'steroids');
