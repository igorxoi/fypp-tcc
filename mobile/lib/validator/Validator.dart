import 'dart:async';

mixin Validators {
  var nomeValidator =
      StreamTransformer<String, String>.fromHandlers(handleData: (name, sink) {
    if (name.contains(RegExp(r'^[a-z A-Z,.\-]+$'))) {
      sink.add(name);
    } else {
      sink.addError('Nome não é válido');
    }
  });

  final validateTitle =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (!value.contains(' ') && value.isNotEmpty) {
      sink.add(value);
    } else {
      sink.addError("title must be one word");
    }
  });

  var emailValidator =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.contains(RegExp(r'[a-zA-Z0-9\+\.\_\%\-\+]{1,256}\@[a-zA-Z0-9]'
        r'[a-zA-Z0-9\-]{0,64}(\.[a-zA-Z0-9][a-zA-Z0-9\-]{0,25})+'))) {
      sink.add(email);
    } else {
      sink.addError('Email não é válido');
    }
  });

  //

  var passwordValidator = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length > 3) {
      sink.add(password);
    } else {
      sink.addError('A senha deve ter no minímo 3 caracteres');
    }
  });
}
