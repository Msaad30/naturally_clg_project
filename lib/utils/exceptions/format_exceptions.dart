class TFormatException implements Exception {
  final String message;

  TFormatException([this.message = 'An unexpected format error occured. Please check your input.']);

  factory TFormatException.fromMessage(String message) {
    return TFormatException(message);
  }

  String get formattedException => message;

  factory TFormatException.fromCode(String code) {
    switch (code) {
      case 'invalid-email-format':
        return TFormatException('The email address format is invalid. Please enter a valid email');
      case 'invalid-phone-number-format':
        return TFormatException('The provided phone number format is invalid. Please enter a valid number.');
      case 'custom-date-format':
        return TFormatException('The date format is invalid. Please enter a valid date.');
      case 'invalid-url-format':
        return TFormatException('The URL format is invalid. Please enter a valid URL.');
      case 'invalid-credit-card-format':
        return TFormatException('The credit card format is invalid. Please enter a valid credit card number.');
      case 'invalid-numeric-format':
        return TFormatException('The input should be a valid numeric format.');
      default:
        return TFormatException('Something went wrong. Please check again.');
    }
  }
}