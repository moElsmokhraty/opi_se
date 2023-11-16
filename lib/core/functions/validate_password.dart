String? validatePassword(String password) {
  bool hasLowercase = false;
  bool hasNumber = false;

  if (password.isEmpty || password.trim().isEmpty) {
    return 'Please enter Password';
  }

  if (password.length < 8) {
    return ('Password must be at least 8 characters long.');
  }

  for (int i = 0; i < password.length; i++) {
    var char = password[i];
    if (RegExp(r'[a-z]').hasMatch(char)) {
      hasLowercase = true;
    } else if (RegExp(r'[0-9]').hasMatch(char)) {
      hasNumber = true;
    }
  }

  if (hasLowercase && hasNumber) {
    return null;
  } else {
    List<String> missingChars = [];
    if (!hasLowercase) {
      missingChars.add('Lowercase letters');
    }
    if (!hasNumber) {
      missingChars.add('Numbers');
    }
    return ('${missingChars.join(', ')} required');
  }
}
