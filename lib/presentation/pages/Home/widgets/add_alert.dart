import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_personal_tracker/application/models/project/project.dart';
import 'package:my_personal_tracker/presentation/pages/Home/widgets/add_milestone.dart';

class AddForm extends HookConsumerWidget {
  const AddForm({Key? key, this.projectParam}) : super(key: key);

  final Project? projectParam;
  // Project project = widget.projectParam ?? Project(
  //   name: "",
  //   milestones: [],
  //   status: ProjectStatus.OnGoing,
  // );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final project = useState(projectParam ??
        Project(
          name: "",
          milestones: [],
          status: ProjectStatus.OnGoing,
          createdAt: DateTime.now(),
        ));

    return AlertDialog(
      title: const Text('Add Project'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              initialValue: project.value.name,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(
                label: Text("Project Name"),
              ),
              onChanged: (value) {
                project.value = project.value.copyWith(name: value);
              },
            ),
            const SizedBox(height: 10),
            DropdownButton(
              hint: const Text("Status"),
              isExpanded: true,
              value: project.value.status,
              items: ProjectStatus.values
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(e.name),
                    ),
                  )
                  .toList(),
              onChanged: (status) {
                project.value = project.value.copyWith(status: status!);
              },
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: ["Name", "Cash", "Status"]
                    .map((e) => DataColumn(label: Text(e)))
                    .toList(),
                rows: project.value.milestones
                    .map(
                      (milestone) => DataRow(
                        cells: [
                          DataCell(Text(milestone.features.join(", "))),
                          DataCell(Text(milestone.cash.toString())),
                          DataCell(Text(milestone.status.name)),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            if (projectParam == null)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Add Milestone?"),
                  IconButton(
                    onPressed: () async {
                      final milestone = await showDialog(
                        context: context,
                        builder: (context) => MilestoneDialog(),
                      );
                      project.value = project.value.copyWith(
                        milestones: [
                          ...project.value.milestones,
                          milestone,
                        ],
                      );
                    },
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text(projectParam == null ? 'Add' : "Save"),
          onPressed: () {
            Navigator.pop(context, project.value);
          },
        ),
      ],
    );
  }
}
