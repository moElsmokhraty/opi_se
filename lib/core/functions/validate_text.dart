String? validateText(String key, String value) {
  if (value.isEmpty || value.trim().isEmpty) {
    return 'Please enter $key';
  } else {
    return null;
  }
}
