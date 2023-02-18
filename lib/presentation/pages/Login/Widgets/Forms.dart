import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/extensions/snackbars.dart';
import '../../../../core/utils/supabase_constant.dart';

class LoginForm extends StatelessWidget {
  LoginForm({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: LayoutBuilder(
        builder: (context, constrains) {
          return SizedBox(
            width: constrains.maxWidth < 600 ? null : constrains.maxWidth * 0.5,
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
                SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.saveAndValidate()) {
                        try {
                          await supabase.auth.signInWithPassword(
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
                    child: const Text("Login"),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
