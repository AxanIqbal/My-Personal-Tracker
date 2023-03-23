import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:my_personal_tracker/core/extensions/snackbars.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/utils/supabase_constant.dart';

class SignupForm extends StatelessWidget {
  SignupForm({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FormBuilderTextField(
            name: 'email',
            decoration: const InputDecoration(
              label: Text("Email"),
            ),
            keyboardType: TextInputType.emailAddress,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.email(),
              FormBuilderValidators.required(),
            ]),
          ),
          FormBuilderTextField(
            obscureText: true,
            name: "password",
            decoration: const InputDecoration(
              label: Text("Password"),
            ),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
            ]),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.saveAndValidate()) {
                try {
                  await supabase.auth.signUp(
                    password: _formKey.currentState!.value["password"],
                    email: _formKey.currentState!.value["email"],
                  );
                } on AuthException catch (e) {
                  context.showSnackbarError(e.message);
                } catch (e) {
                  context.showSnackbarError("$e");
                }
              }
            },
            child: const Text("Sign Up"),
          )
        ],
      ),
    );
  }
}
