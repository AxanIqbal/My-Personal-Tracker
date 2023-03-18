import 'package:intl/intl.dart';

extension Currency on double {
  String toCompact() {
    return NumberFormat.compactCurrency(
      decimalDigits: 2,
      symbol: '\$',
    ).format(this);
  }
}
