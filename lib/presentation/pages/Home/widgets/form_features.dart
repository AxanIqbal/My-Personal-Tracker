import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormFeatureList extends FormBuilderField<List<String>> {
  TextEditingController? controller;
  final TextStyle? style;

  FormFeatureList({
    super.key,
    required super.name,
    super.validator,
    super.decoration,
    super.onChanged,
    super.valueTransformer,
    super.enabled,
    super.onSaved,
    super.onReset,
    super.focusNode,
    this.style,
    List<String>? initialValue,
    this.controller,
  }) : super(
          initialValue: initialValue,
          builder: (list) {
            final controller1 = TextEditingController();
            return Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: list.value
                          ?.map((e) => ListTile(
                                // dense: true,
                                title: Text(e),
                                trailing: IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                  onPressed: () => list.didChange(list.value!
                                      .where((element) => element != e)
                                      .toList()),
                                ),
                              ))
                          .toList() ??
                      [],
                ),
                TextField(
                  controller: controller1,
                  decoration: InputDecoration(
                    label: const Text("Add Feature"),
                    suffix: ElevatedButton(
                      onPressed: () {
                        if (controller1.value.text.trim() != "") {
                          list.didChange(
                              [...?list.value, controller1.value.text.trim()]);
                        }
                      },
                      child: const Text("Add"),
                    ),
                  ),
                  keyboardType: TextInputType.name,
                  textCapitalization: TextCapitalization.words,
                  style: style,
                )
              ],
            );
          },
        );
}
