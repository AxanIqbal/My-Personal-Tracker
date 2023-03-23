import 'package:flutter/material.dart';

import 'Widgets/form.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const SizedBox(height: 50.0),
              Text(
                "Sign Up",
                style: Theme.of(context).textTheme.displayLarge,
              ),
              Expanded(child: SignupForm()),
            ],
          ),
        ),
      ),
    );
  }
}
