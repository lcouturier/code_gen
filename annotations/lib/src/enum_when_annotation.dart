// ignore_for_file: depend_on_referenced_packages

import 'package:meta/meta_meta.dart';

@Target({TargetKind.enumType})
class EnumExtension {
  final bool hasChecker;
  final bool hasWhen;
  final bool hasMap;
  final bool hasMaybeWhen;
  final bool hasMaybeMap;
  const EnumExtension({
    this.hasWhen = true,
    this.hasMap = true,
    this.hasMaybeWhen = true,
    this.hasMaybeMap = true,
    this.hasChecker = true,
  });
}

const enumExtension = EnumExtension();
