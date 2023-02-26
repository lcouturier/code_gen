import 'package:annotations/annotations.dart';

part 'card_status.g.dart';

@whenAnnotation
enum CardStatus {
  active("Active"),
  issued("Issued"),
  blocked("Blocked"),
  lost("Lost"),
  damaged("Damaged"),
  cancelled("Cancelled"),
  stolen("Stolen"),
  pending("Pending"),
  expired("Expired");

  const CardStatus(this.label);

  final String label;
}
