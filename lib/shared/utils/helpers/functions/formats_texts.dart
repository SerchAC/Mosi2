class FormatsTexts {
  static String maskName(String fullName) {
    return fullName.split(' ').map((word) {
      if (word.isEmpty) return '';
      final firstLetter = word[0];
      final dots = '•' * (word.length - 1);
      return '$firstLetter$dots';
    }).join(' ');
  }

  static String maskEmail(String email) {
    final parts = email.split('@');
    if (parts.length != 2) return email;

    final user = parts[0];
    final domainParts = parts[1].split('.');
    if (domainParts.length < 2) return email;

    // Usuario: mantener primeros 2 y últimos dígitos si hay
    final first2 = user.substring(0, 2);
    final lastDigits = RegExp(r'\d+$').stringMatch(user) ?? '';
    final maskedMiddle =
        '•' * (user.length - first2.length - lastDigits.length);
    final maskedUser = '$first2$maskedMiddle$lastDigits';

    // Dominio: g••••
    final domainName = domainParts[0];
    final domainMasked = domainName.isNotEmpty
        ? '${domainName[0]}${'•' * (domainName.length - 1)}'
        : domainName;

    final tld = domainParts.sublist(1).join('.');

    return '$maskedUser@$domainMasked.$tld';
  }

  static String getMonth(int month) {
    const months = [
      'Ene',
      'Feb',
      'Mar',
      'Abr',
      'May',
      'Jun',
      'Jul',
      'Ago',
      'Sep',
      'Oct',
      'Nov',
      'Dic'
    ];
    return months[month - 1];
  }

  static String formatDurationHuman(Duration duration) {
  final days = duration.inDays;

  if (days >= 365) {
    final years = (days / 365).round();
    return '$years ${years == 1 ? 'año' : 'años'}';
  } else if (days >= 30) {
    final months = (days / 30).round();
    return '$months ${months == 1 ? 'mes' : 'meses'}';
  } else {
    return '$days ${days == 1 ? 'día' : 'días'}';
  }
}
}
