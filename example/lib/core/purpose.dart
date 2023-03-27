import 'package:annotations/annotations.dart';

part 'purpose.g.dart';

@SteroidsEnum(hasMaybeMap: false, hasMaybeWhen: false)
enum Purpose {
  loadTransaction,
  successfulTransaction,
  declinedTransaction,
  marketingCommunication,
}
