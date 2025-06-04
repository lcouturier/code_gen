import 'package:annotations/annotations.dart';

part 'example_enum_custom.g.part';

@EnumExtension(hasChecker: false, hasMaybeMap: false, hasMaybeWhen: false)
enum TestEnumCustom {
  first,
  second
}
