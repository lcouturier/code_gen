library generators;

import 'package:build/build.dart';
import 'package:generators/src/enum_when_generator.dart';
import 'package:source_gen/source_gen.dart';

Builder generateEnumWhen(BuilderOptions options) => SharedPartBuilder(
      [EnumWhenGenerator()],
      'enum_when_generator',
    );
