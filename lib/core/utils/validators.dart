class Validators {
  static String? nameValidator(String? value) {
    if (value == "" && value != null) {
      return 'Пожалуйста заполните поле';
    }

    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == "" && value != null) {
      return 'Пожалуйста заполните поле';
    }

    return null;
  }

  static String? confirmPasswordValidator(String? value, String password) {
    if (value == "") {
      return 'Пожалуйста заполните поле';
    } else if (value != password) {
      return "Пароль не совпадают";
    }

    return null;
  }
}
