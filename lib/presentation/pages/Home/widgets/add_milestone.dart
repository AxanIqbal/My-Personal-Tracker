import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_personal_tracker/application/models/milestones/milestone.dart';

import '../../../../application/provider/providers.dart';

class MilestoneDialog extends HookConsumerWidget {
  MilestoneDialog({
    Key? key,
    this.milestone,
    this.index,
    this.mIndex,
  }) : super(key: key);

  final _formKey = GlobalKey<FormBuilderState>();
  final Milestone? milestone;
  final int? index;
  final int? mIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userNotify = ref.read(userNotifierProvider.notifier);

    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FormBuilderTextField(
                name: 'name',
                initialValue: milestone?.name,
                decoration: const InputDecoration(
                  label: Text("Name"),
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
              ),
              FormBuilderTextField(
                name: 'cash',
                initialValue:
                    milestone == null ? null : milestone!.cash.toString(),
                decoration: const InputDecoration(
                  label: Text("Cash"),
                ),
                keyboardType: TextInputType.number,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.numeric(),
                  FormBuilderValidators.required(),
                ]),
              ),
              FormBuilderDropdown(
                name: "status",
                // isDense: true,
                // isExpanded: false,
                initialValue: milestone?.status ?? MilestoneStatus.Pending,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
                items: MilestoneStatus.values
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(e.name),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if (milestone != null)
                    ElevatedButton(
                      onPressed: () async {
                        userNotify.removeProjectMilestone(index!, milestone!);
                        await userNotify
                            .toFirebase()
                            .then((value) => Navigator.pop(context));
                      },
                      child: const Text(
                        "Delete",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.saveAndValidate()) {
                        final milestoneLocal = Milestone(
                          name: _formKey.currentState!.value["name"],
                          cash: double.parse(
                              _formKey.currentState!.value["cash"]),
                          createdDate: milestone?.createdDate ?? DateTime.now(),
                          uploadDate: DateTime.now(),
                          status: _formKey.currentState!.value["status"],
                        );

                        if (milestone != null) {
                          userNotify.upgradeProjectMilestone(
                            index!,
                            mIndex!,
                            milestoneLocal,
                          );
                          return userNotify
                              .toFirebase()
                              .then((value) => Navigator.pop(context));
                        }

                        Navigator.pop(
                          context,
                          milestoneLocal,
                        );
                      }
                    },
                    child: Text(
                      milestone == null ? "Add" : "Save",
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
