import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_personal_tracker/application/models/milestones/milestone.dart';
import 'package:my_personal_tracker/core/extensions/currency.dart';

import '../../../../application/provider/providers.dart';
import '../../../../core/utils/supabase_constant.dart';
import '../../../Themes/colors.dart';
import '../../Home/widgets/add_milestone.dart';

class MilestoneTile extends HookConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40.0,
            backgroundColor: milestoneColors[milestone.status],
            child: CircleAvatar(
              radius: 30.0,
              backgroundColor: Colors.white,
              child: Text(
                milestone.cash.toCompact(),
                style: const TextStyle(
                  color: Colors.black87,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: milestone.features
                  .map((e) => Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.circle,
                            size: 10,
                            color: milestoneColors[milestone.status],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            e,
                            style: TextStyle(
                              color: milestoneColors[milestone.status],
                            ),
                          ),
                        ],
                      ))
                  .toList(),
            ),
          ),
          IconButton(
            onPressed: () async {
              final milestoneLocal = await showDialog<Milestone>(
                context: context,
                builder: (context) => MilestoneDialog(
                  milestone: milestone,
                  index: index,
                  mIndex: mIndex,
                ),
              );
              if (milestoneLocal != null) {
                print("$milestoneLocal the milestone edited");
                await supabase
                    .from("milestone")
                    .update(milestoneLocal.toJson())
                    .eq("id", milestoneLocal.id);
                ref.invalidate(userSupabaseProvider);
              }
            },
            icon: Icon(
              Icons.edit,
              color: milestoneColors[milestone.status],
            ),
          ),
          // ListTile(
          //   isThreeLine: true,
          //   title: Text("MileStone# ${index + 1}"),
          //   subtitle: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: milestone.features
          //         .map((e) => Row(
          //               crossAxisAlignment: CrossAxisAlignment.center,
          //               children: [
          //                 Icon(
          //                   Icons.circle,
          //                   size: 10,
          //                   color: milestoneColors[milestone.status],
          //                 ),
          //                 const SizedBox(
          //                   width: 10,
          //                 ),
          //                 Text(e),
          //               ],
          //             ))
          //         .toList(),
          //   ),
          //   selected: milestone.status != MilestoneStatus.Pending,
          //   selectedColor: milestoneColors[milestone.status],
          //   trailing: IconButton(
          //     onPressed: () async {
          //       final milestoneLocal = await showDialog<Milestone>(
          //         context: context,
          //         builder: (context) => MilestoneDialog(
          //           milestone: milestone,
          //           index: index,
          //           mIndex: mIndex,
          //         ),
          //       );
          //       if (milestoneLocal != null) {
          //         print("$milestoneLocal the milestone edited");
          //         await supabase
          //             .from("milestone")
          //             .update(milestoneLocal.toJson())
          //             .eq("id", milestoneLocal.id);
          //         ref.invalidate(userSupabaseProvider);
          //       }
          //     },
          //     icon: const Icon(Icons.edit),
          //   ),
          //   // "Cash: ${milestone.cash}, status: ${milestone.status.name}",
          // ),
        ],
      ),
    );
  }
}
