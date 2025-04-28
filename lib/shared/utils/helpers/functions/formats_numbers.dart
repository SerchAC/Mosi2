class FormatsNumbers {
  static String formatMaskedNumber(String input) {
    if (input.length < 6) return input; // No se puede enmascarar correctamente

    final first2 = input.substring(0, 2);
    final last4 = input.substring(input.length - 4);
    return '$first2 •••• $last4';
  }
}
