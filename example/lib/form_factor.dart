import 'package:annotations/annotations.dart';

part 'form_factor.g.dart';

@steroids
enum FormFactor {
  plastic,
  virtual,
}

extension FormFactorPatternMatch on FormFactor {
  T when<T>({
    required T Function() plastic,
    required T Function() virtual,
  }) {
    switch (this) {
      case FormFactor.plastic:
        return plastic();
      case FormFactor.virtual:
        return virtual();
    }
  }
}
