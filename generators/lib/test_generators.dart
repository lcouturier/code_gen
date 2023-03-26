library test_generators;

import 'package:build/build.dart';
import 'package:generators/src/enum_extensions_generator_test.dart';
import 'package:source_gen/source_gen.dart';

Builder myTestClassBuilder(BuilderOptions options) => PartBuilder([TestSteroidsGenerator()], 'steroidstest.*');
