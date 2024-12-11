class UserValidator {
  UserValidator._();

  static String? validateName(String? value) {
    final RegExp regexNum = RegExp(r'[0-9]');
    final RegExp regexSpecial = RegExp(r'[!@#$%^&*(),.?":{}|<>]');

    if (value == null || value.isEmpty) {
      return 'Por favor informe o seu nome completo';
    } else if ((value.length < 5 && value.length > 30) ||
        regexSpecial.hasMatch(value) ||
        regexNum.hasMatch(value)) {
      return 'Nome Inválido';
    }
    return null;
  }

  static String? validateEmail(value) {
    final RegExp regexEmail = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
    if (value == null || value.isEmpty) {
      return 'Por favor informe o seu e-mail';
    } else if (value.length < 3 || !regexEmail.hasMatch(value)) {
      return 'E-mail inválido';
    }
    return null;
  }

  static String? validateContact(value) {
    final RegExp regexSpecial = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
    final RegExp regexNum = RegExp(r'[0-9]');
    if (value == null || value.isEmpty) {
      return 'Por favor informe o seu número de contato';
    } else if (value.length < 5 ||
        value.length > 30 ||
        !regexNum.hasMatch(value) ||
        regexSpecial.hasMatch(value)) {
      return 'Número inválido';
    }
    return null;
  }

  static String? validateUserName(value) {
    if (value == null || value.isEmpty) {
      return 'Por favor informe o seu usuário';
    } else if (value.length < 3 || value.length > 30) {
      return 'Usuário Inválido';
    }
    return null;
  }

  static String? validatePassword(value) {
    final RegExp regexPassword = RegExp(
        r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$'); // Testing193!
    if (value == null || value.isEmpty) {
      return 'Por favor informe a senha';
    } else if (!regexPassword.hasMatch(value)) {
      return 'Senha inválida';
    }
    return null;
  }

  static String? validateConfirmPassword(String? value, String? compareTo) {
    if (compareTo != value) {
      return 'As senhas devem ser iguais';
    }
    return null;
  }
}
