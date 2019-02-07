import 'package:flutter/material.dart';
import '../mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  Widget build(context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 40, 20, 40),
      child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              emailField(),
              Padding(padding: EdgeInsets.only(top: 5)),
              passwordField(),
              Padding(padding: EdgeInsets.only(top: 10)),
              submitButton(),
            ],
          )),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email Address',
        hintText: 'you@example.com',
      ),
      validator: validateEmail,
      onSaved: (String value) {
        email = value;
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: '******',
      ),
      validator: validatePassword,
      onSaved: (String value) {
        password = value;
      },
    );
  }

  Widget submitButton() {
    return RaisedButton(
        child: Text('lool'),
        color: Colors.green,
        textColor: Colors.white,
        onPressed: () {
          if (formKey.currentState.validate()) {
            formKey.currentState.save();
            print('$email and $password');
          }
        });
  }
}
