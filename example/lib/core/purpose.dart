import 'package:annotations/annotations.dart';

part 'purpose.g.dart';

@steroids
enum Purpose {
  loadTransaction,
  successfulTransaction,
  declinedTransaction,
  marketingCommunication,
}
