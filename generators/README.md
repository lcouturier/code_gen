<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

TODO: Put a short description of the package here that helps potential users
know whether this package might be useful for them.

## Features

TODO: List what your package can do. Maybe include images, gifs, or videos.

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder.

```dart
const like = 'sample';
```

## Automated Unit Test Generation

This package includes a `Builder` that can automatically generate unit tests for your enums that are annotated with `@EnumExtension` from the `annotations` package. This helps ensure your enum extensions behave as expected with minimal manual test writing.

### Enabling the Test Generator

To enable the `unitTestBuilder`, you need to configure it in your `build.yaml` file. Add the following builder definition and include it in your target's builders list:

```yaml
targets:
  $default:
    builders:
      # Other builders...
      your_package_name|unit_test_generator: # Replace your_package_name with your actual package name
        enabled: true

builders:
  # Other builders...
  unit_test_generator:
    import: "package:generators/builders.dart" # Assuming 'generators' is the name of this package
    builder_factories: ["unitTestBuilder"]
    build_extensions: { ".dart": [".test.dart"] } # Generates .test.dart from .dart
    auto_apply: dependents
    build_to: cache # Or 'source' if you prefer to check in generated tests
```
**Note:** Ensure you replace `your_package_name` with the actual name of the package where you are enabling this builder if it's not directly within the `generators` package itself (e.g., if used as a dependency). If you are using this within the `generators` package (e.g. for its own enums), you might use `generators|unit_test_generator`.

### Coverage

The generated tests aim to cover the following functionalities of the enum extensions:

*   **`when` and `maybeWhen` methods**: Ensures each enum value correctly maps to its corresponding callback, and `orElse` is handled for `maybeWhen`.
*   **`map` and `maybeMap` methods**: Verifies that each enum value is correctly mapped, including the `orElse` case for `maybeMap`.
*   **`is<Value>` boolean getters**: Checks that `isMyValue` returns `true` only for `MyEnum.myValue` and `false` otherwise.
*   **`fromName(String name)` static method**: Tests successful parsing of valid names (case-insensitively) and that an `ArgumentError` is thrown for invalid names.
*   **`fromOrdinal(int ordinal)` static method**: Tests successful parsing of valid ordinals and that an `ArgumentError` is thrown for out-of-bounds ordinals.

### Naming Convention

The generated test files follow the naming convention: `source_file_name.test.dart`. For example, if your enum is defined in `lib/src/my_enum.dart`, the generated test file will be `lib/src/my_enum.test.dart`. These files will be placed either in the build cache (`build_to: cache`) or alongside your source files (`build_to: source`) depending on your `build.yaml` configuration.

## Additional information

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more.
