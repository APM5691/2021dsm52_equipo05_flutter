import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_authentication_with_laravel_sanctum/providers/auth.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email;
  String _password;

  void submit() {
    Provider.of<Auth>(context, listen: false)
        .login(credentials: {'email': _email, 'password': _password});
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    bool _obscureText = true;
    void _toggle() {
      setState(() {
        _obscureText = !_obscureText;
      });
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("Login"),
        ),
        body: Form(
            key: _formKey,
            child: Scrollbar(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: Column(children: [
                  TextFormField(
                      initialValue: 'al221910@gmail.com',
                      decoration: InputDecoration(
                          labelText: "Email", hintText: "you@domewhere.com"),
                      onSaved: (value) {
                        _email = value;
                      }),
                  TextFormField(
                      initialValue: '123456789',
                      decoration: InputDecoration(labelText: "Password"),
                      obscureText: _obscureText,
                      onSaved: (value) {
                        _password = value;
                      }),
                  SizedBox(
                    width: double.infinity,
                    child: FlatButton(
                      child: Text("login"),
                      onPressed: () {
                        _formKey.currentState.save();

                        this.submit();
                      },
                    ),
                  )
                ]),
              ),
            )));
  }
}
