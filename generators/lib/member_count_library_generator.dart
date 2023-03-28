import 'package:build/build.dart';
import 'package:generators/src/member_count_generator.dart';
import 'package:source_gen/source_gen.dart';

Builder metadataLibraryBuilder(BuilderOptions options) => LibraryBuilder(
      MemberCountLibraryGenerator(),
      generatedExtension: '.test.dart',
    );
