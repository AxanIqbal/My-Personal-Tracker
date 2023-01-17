import 'package:flutter/material.dart';
import 'package:my_personal_tracker/application/models/project/project.dart';
import 'package:my_personal_tracker/presentation/pages/Home/widgets/add_milestone.dart';

class AddForm extends StatefulWidget {
  const AddForm({Key? key}) : super(key: key);

  @override
  State<AddForm> createState() => _AddFormState();
}

class _AddFormState extends State<AddForm> {
  Project project = Project(
    name: "",
    milestones: [],
    status: ProjectStatus.OnGoing,
  );

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Project'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                label: Text("Project Name"),
              ),
              onChanged: (value) {
                setState(() {
                  project = project.copyWith(name: value);
                });
              },
            ),
            const SizedBox(height: 10),
            DropdownButton(
              hint: const Text("Status"),
              isExpanded: true,
              value: project.status,
              items: ProjectStatus.values
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(e.name),
                    ),
                  )
                  .toList(),
              onChanged: (status) {
                project = project.copyWith(status: status!);
                setState(() {});
              },
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: ["Name", "Cash", "Status"]
                    .map((e) => DataColumn(label: Text(e)))
                    .toList(),
                rows: project.milestones
                    .map(
                      (milestone) => DataRow(
                        cells: [
                          DataCell(Text(milestone.name)),
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
                    project = project.copyWith(
                      milestones: [
                        ...project.milestones,
                        milestone,
                      ],
                    );
                    setState(() {});
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
          child: const Text('Add'),
          onPressed: () {
            Navigator.pop(context, project);
          },
        ),
      ],
    );
  }
}
