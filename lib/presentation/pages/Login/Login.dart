import 'package:flutter/material.dart';

import 'Widgets/Forms.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: LoginForm(),
        ),
      ),
    );
  }
}
