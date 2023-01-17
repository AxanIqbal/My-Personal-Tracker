import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_personal_tracker/core/utils/firebase_constants.dart';
import 'package:my_personal_tracker/presentation/pages/Home/widgets/add_alert.dart';
import 'package:my_personal_tracker/presentation/pages/Home/widgets/add_milestone.dart';

import '../../../application/models/milestones/milestone.dart';
import '../../../application/models/project/project.dart';
import '../../../application/provider/providers.dart';
import 'widgets/milestone_tile.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = FirebaseAuth.instance.currentUser;
    final userProvider = ref.watch(userNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(
            onPressed: () => FirebaseAuth.instance.signOut(),
            child: const Text(
              "Log Out",
              style: TextStyle(color: Colors.redAccent),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final project = await showDialog<Project>(
            context: context,
            builder: (BuildContext dialogContext) {
              return const AddForm();
            },
          );
          if (project != null) {
            await usersProject.doc(user!.uid).update({
              "projects": FieldValue.arrayUnion([project.toJson()])
            });
          }
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: userProvider.user.projects
              .asMap()
              .map((projectIndex, project) => MapEntry(
                    projectIndex,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              project.name,
                              style: Theme.of(context).textTheme.headline3,
                            ),
                            Tooltip(
                              message: "Total: \$ ${project.total}\n"
                                  "Earned: \$ ${project.earned}\n"
                                  "Remaining: \$ ${project.remaining}\n",
                              child: const Icon(Icons.info),
                            ),
                          ],
                        ),
                        ...project.milestones
                            .asMap()
                            .map(
                              (index, milestone) => MapEntry(
                                index,
                                MilestoneTile(
                                  milestone: milestone,
                                  index: projectIndex,
                                  mIndex: index,
                                ),
                              ),
                            )
                            .values
                            .toList(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Add Milestone?"),
                            IconButton(
                              onPressed: () async {
                                final milestone = await showDialog<Milestone>(
                                  context: context,
                                  builder: (context) => MilestoneDialog(
                                    index: projectIndex,
                                  ),
                                );
                                if (milestone != null) {
                                  userProvider.addProjectMilestone(
                                      projectIndex, milestone);
                                  await userProvider.toFirebase();
                                }
                              },
                              icon: const Icon(Icons.add),
                            ),
                          ],
                        )
                      ],
                    ),
                  ))
              .values
              .toList(),
        ),
      ),
    );
  }
}
