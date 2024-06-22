
import 'package:intl/intl.dart';

double convertUsdToIdr(double usdAmount) {
  final double conversionRate = 16500.50;
  return usdAmount * conversionRate;
}

String formatCurrency(double amount) {
  final formatter = NumberFormat('#,###');
  return formatter.format(amount).replaceAll(",", ".");
}
