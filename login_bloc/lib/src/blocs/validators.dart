import 'dart:async';

class Validators {
  final validateEmail = StreamTransformer<String, String>
    .fromHandlers(handleData: (email, sink) {
    if (email.contains('@')) {
      sink.add(email);
    } else {
      sink.addError('Your email must contain a @');
    }
  });

  final validatePassword = StreamTransformer<String, String>
    .fromHandlers(handleData: (password, sink) {
    if (password.length > 3) {
      sink.add(password);
    } else {
      sink.addError('Your password should minimum be 4 characetsr long');
    }
  });
}
