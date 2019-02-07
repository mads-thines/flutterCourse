import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';

class LoginScreen extends StatelessWidget {
  Widget build(context) {
    final bloc = Provider.of(context);

    return Container(
        margin: EdgeInsets.fromLTRB(20, 40, 20, 20),
        child: Column(
          children: <Widget>[
            emailField(bloc),
            Padding(padding: EdgeInsets.only(bottom: 20)),
            passwordField(bloc),
            Padding(padding: EdgeInsets.only(bottom: 20)),
            submitButton(bloc),
          ],
        ));
  }

  Widget emailField(Bloc bloc) {
    return StreamBuilder(
        stream: bloc.email,
        builder: (context, snapshot) {
          return TextField(
            keyboardType: TextInputType.emailAddress,
            onChanged: bloc.changeEmail,
            decoration: InputDecoration(
              labelText: 'Email address',
              hintText: 'you@example.com',
              errorText: snapshot.error,
            ),
          );
        });
  }

  Widget passwordField(Bloc bloc) {
    return StreamBuilder(
        stream: bloc.password,
        builder: (context, snapshot) {
          return TextField(
            onChanged: bloc.changePassword,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              hintText: '******',
              errorText: snapshot.error,
            ),
          );
        });
  }

  Widget submitButton(Bloc bloc) {
    return StreamBuilder(
        stream: bloc.submitValid,
        builder: (context, snapshot) {
          return RaisedButton(
              child: Text('Login'),
              color: Colors.green,
              onPressed: snapshot.hasData
                  ? bloc.submit
                  : null);
        });
  }
}
