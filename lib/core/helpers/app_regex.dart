class AppRegex {
  AppRegex._();

  static bool isNameValid(String name) {
    return RegExp(r'^[a-zA-Z]+$').hasMatch(name);
  }

  static bool isPhoneValid(String phone) {
    return RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')
        .hasMatch(phone);
  }

  static bool isUsernameValid(String username) {
    return RegExp(r'^[a-zA-Z0-9]+$').hasMatch(username);
  }

  static bool isWebsiteValid(String website) {
    return RegExp(
            r'^https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)$')
        .hasMatch(website);
  }

  static bool isUrlValid(String url) {
    return RegExp(
            r'^https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)$')
        .hasMatch(url);
  }

  static bool isImageUrlValid(String imageUrl) {
    return RegExp(
            r'^https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)$')
        .hasMatch(imageUrl);
  }

  static bool isVideoUrlValid(String videoUrl) {
    return RegExp(
            r'^https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)$')
        .hasMatch(videoUrl);
  }

  static bool isFileUrlValid(String fileUrl) {
    return RegExp(
            r'^https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)$')
        .hasMatch(fileUrl);
  }

  static bool isEmailValid(String email) {
    return RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(email);
  }

  static bool isPasswordValid(String password) {
    return RegExp(
            r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$')
        .hasMatch(password);
  }

  static bool hasLowerCase(String password) {
    return RegExp(r'^(?=.*[a-z])').hasMatch(password);
  }

  static bool hasUpperCase(String password) {
    return RegExp(r'^(?=.*[A-Z])').hasMatch(password);
  }

  static bool hasNumber(String password) {
    return RegExp(r'^(?=.*?[0-9])').hasMatch(password);
  }

  static bool hasSpecialCharacter(String password) {
    return RegExp(r'^(?=.*?[@$!%*?&])').hasMatch(password);
  }

  static bool hasMinLength(String password) {
    return RegExp(r'^(?=.{8,})').hasMatch(password);
  }
}




/*
validator: (value) {
if (value == null || value.isEmpty) {
return 'Password cannot be empty';
}
if (!AppRegex.isPasswordValid(value)) {
return 'Password must have:\n'
'- At least 8 characters\n'
'- At least 1 uppercase letter\n'
'- At least 1 lowercase letter\n'
'- At least 1 number\n'
'- At least 1 special character';
}
return null; // Validation passed
},*/

