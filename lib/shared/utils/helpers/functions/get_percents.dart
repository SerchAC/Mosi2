class GetPercents {
  static double savingsPercent(String amount, String savings) {
    final double amountValue = double.parse(amount);
    final double savingsValue = double.parse(savings);

    return (savingsValue / amountValue);
  }

  static double pendingPercent(String amount, String? pending) {
    final double amountValue = double.parse(amount);
    final double pendingValue =
        pending != null ? double.tryParse(pending) ?? 0 : 0;

    return (pendingValue / amountValue);
  }
}
