import 'package:auth_starter/providers/auth_provider.dart';
import 'package:auth_starter/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final AuthProvider auth =
          Provider.of<AuthProvider>(context, listen: false);

      auth.fetchUser();

      if (await auth.loggedIn) {
        print('[Authentication] You are logged in');
        Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login Screen'),
          centerTitle: true,
        ),
        body: SafeArea(
            child: Center(
          child: Container(padding: EdgeInsets.all(20.0), child: LoginForm()),
        )));
  }
}
