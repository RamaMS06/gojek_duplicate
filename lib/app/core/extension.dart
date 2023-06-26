import 'package:intl/intl.dart';

//String Extension
String formatCurrency(String amount, {String? symbol}) {
  double value = double.parse(amount);
  final formatter = NumberFormat.currency(
      locale: 'id', symbol: symbol ?? '', decimalDigits: 0);
  return formatter.format(value);
}
