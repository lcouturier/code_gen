class StringUtilities {
  static String toCamelCase(String str) {
    if (str.isEmpty) return str;

    final words = str.split(RegExp(r'[_\- ]'));
    final firstWord = words.removeAt(0);
    final camelCaseWords = words.map((word) => word.substring(0, 1).toUpperCase() + word.substring(1).toLowerCase());

    return '$firstWord${camelCaseWords.join()}';
  }

  static String toPascalCase(String str) {
    if (str.isEmpty) return str;

    final words = str.split(RegExp(r'[_\- ]'));
    final pascalCaseWords = words.map((word) => word.substring(0, 1).toUpperCase() + word.substring(1).toLowerCase());

    return pascalCaseWords.join();
  }
}
