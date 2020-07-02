import 'package:auth_starter/providers/auth_provider.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final auth = AuthProvider();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            controller: emailController,
            validator: (value) {
              if (value.isEmpty) {
                return 'Email address is required.';
              }

              return null;
            },
            decoration: InputDecoration(labelText: 'Email'),
          ),
          TextFormField(
            controller: passwordController,
            obscureText: true,
            validator: (value) {
              if (value.isEmpty) {
                return 'Password is required.';
              }

              return null;
            },
            decoration: InputDecoration(labelText: 'Password'),
          ),
          SizedBox(height: 20.0),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: FlatButton.icon(
              icon: Icon(Icons.chevron_right),
              label: Text('SIGN IN'),
              onPressed: () async {
                if (!_formKey.currentState.validate()) {
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text('Unable to login.')));
                }

                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text('Signing In...')));

                if (await auth.login(
                        emailController.text, passwordController.text) ==
                    200) {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/', (route) => false);
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
