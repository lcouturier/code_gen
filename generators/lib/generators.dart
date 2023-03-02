library generators;

import 'package:build/build.dart';
import 'package:generators/src/enum_when_generator.dart';
import 'package:source_gen/source_gen.dart';

Builder steroidsGenerator(BuilderOptions options) => SharedPartBuilder([EnumWhenGenerator()], 'steroids');
