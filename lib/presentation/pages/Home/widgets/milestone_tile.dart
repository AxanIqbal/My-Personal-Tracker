import 'package:flutter/material.dart';
import 'package:my_personal_tracker/application/models/milestones/milestone.dart';
import 'package:my_personal_tracker/presentation/pages/Home/widgets/add_milestone.dart';

class MilestoneTile extends StatelessWidget {
  const MilestoneTile({
    Key? key,
    required this.milestone,
    required this.index,
    this.mIndex,
  }) : super(key: key);

  final Milestone milestone;
  final int index;
  final int? mIndex;

  @override
  Widget build(BuildContext context) {
    final Map<MilestoneStatus, Color> colors = {
      MilestoneStatus.Complete: Colors.green,
      MilestoneStatus.Lost: Colors.red,
    };

    return ListTile(
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Cash: ${milestone.cash}"),
          Text("Status: ${milestone.status.name}"),
        ],
      ),
      title: Text(milestone.name),
      selected: milestone.status != MilestoneStatus.Pending,
      selectedColor: colors[milestone.status],
      trailing: IconButton(
        onPressed: () async {
          await showDialog(
            context: context,
            builder: (context) => MilestoneDialog(
              milestone: milestone,
              index: index,
              mIndex: mIndex,
            ),
          );
        },
        icon: const Icon(Icons.edit),
      ),
      // "Cash: ${milestone.cash}, status: ${milestone.status.name}",
    );
  }
}
