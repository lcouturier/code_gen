// ignore_for_file: depend_on_referenced_packages

import 'package:meta/meta_meta.dart';

@Target({TargetKind.enumType})
class SteroidsEnum {
  final bool hasChecker;
  final bool hasWhen;
  final bool hasMap;
  final bool hasMaybeWhen;
  final bool hasMaybeMap;
  final bool hasOnlyWhen;
  const SteroidsEnum({
    this.hasWhen = true,
    this.hasMap = true,
    this.hasMaybeWhen = true,
    this.hasMaybeMap = true,
    this.hasOnlyWhen = true,
    this.hasChecker = true,
  });
}

const steroids = SteroidsEnum();
