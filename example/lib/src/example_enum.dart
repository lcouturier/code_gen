import 'package:annotations/annotations.dart';

part 'example_enum.g.part'; // For steroidsBuilder
// No part for test generator as it creates a separate file

@EnumExtension()
enum TestEnum {
  alpha,
  beta,
  gamma
}
