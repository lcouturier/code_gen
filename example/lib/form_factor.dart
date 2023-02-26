import 'package:annotations/annotations.dart';

part 'form_factor.g.dart';

@whenAnnotation
enum FormFactor {
  plastic,
  virtual,
}
