import 'package:annotations/annotations.dart';

part 'purpose.g.dart';

@whenAnnotation
enum Purpose {
  loadTransaction,
  successfulTransaction,
  declinedTransaction,
  marketingCommunication,
}
