String? validatePhoneNumber(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Phone number cannot be empty';
  }

  const phonePattern = r'^\+?[0-9]{10,15}$';
  final regex = RegExp(phonePattern);

  if (!regex.hasMatch(value.trim())) {
    return 'Enter a valid phone number';
  }
  return null;
}
