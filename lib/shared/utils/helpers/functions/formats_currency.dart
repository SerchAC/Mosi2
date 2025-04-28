import 'package:intl/intl.dart';

class FormatsCurrency {
  static String formatCurrency(double amount) {
    final formatter = NumberFormat.currency(
      locale: 'es_MX',
      symbol: '\$', // Símbolo de moneda
      decimalDigits: 2, // Asegura siempre dos decimales
    );
    return formatter.format(amount);
  }
}
