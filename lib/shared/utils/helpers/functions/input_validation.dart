class InputValidation {
  static bool isValidAmount(String input) {
    RegExp regex = RegExp(r'^\d+(\.\d{0,2})?$');
    return regex.hasMatch(input);
  }
}
