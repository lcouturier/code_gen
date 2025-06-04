extension StringExtensions on String {
  String get toCamelCase {
    if (isEmpty) return this;

    final words = split(RegExp(r'[_\- ]'));
    final firstWord = words.removeAt(0);
    final camelCaseWords = words.map((word) => word.substring(0, 1).toUpperCase() + word.substring(1).toLowerCase());

    return '$firstWord${camelCaseWords.join()}';
  }

  String get toPascalCase {
    if (isEmpty) return this;

    final words = split(RegExp(r'[_\- ]'));
    final pascalCaseWords = words.map((word) => word.substring(0, 1).toUpperCase() + word.substring(1).toLowerCase());

    return pascalCaseWords.join();
  }
}
