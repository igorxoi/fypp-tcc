class ValidationMixin {
  String validateName(String text) {
    if (text.contains(' ')) return null;
    return 'Digite seu nome completo por favor';
  }

  String validateTitle(String text) {
    if (text.contains(' ')) return "title must be one word";
    return null;
  }

  String validateCpf(String text) {
    if (text.contains(RegExp(r'\d'))) return null;
    return 'CPF inválido';
  }

  String validateCep(String text) {
    if (text.contains(RegExp(r'\d'))) return null;
    return 'CEP inválido';
  }

  String validateEmail(String text) {
    if (text.contains('@') && text.contains('.')) return null;
    return 'Email inválido';
  }

  String validatePhone(String text) {
    if (text.contains(RegExp(r'\d'))) return null;
    if(text.length < 9) return 'Número inválido';
    return 'Número inválido';
  }

  String validatePassword(String text) {
    if (text.contains(' ')) return 'A senha não deve conter espaços';
    if (text.length < 5) return 'A senha deve ter pelo menos 5 caracteres';
    return null;
  }
}
