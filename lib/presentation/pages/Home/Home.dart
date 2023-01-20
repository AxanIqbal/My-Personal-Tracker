import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_personal_tracker/core/extensions/snackbars.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../application/models/milestones/milestone.dart';
import '../../../application/models/project/project.dart';
import '../../../application/provider/providers.dart';
import '../../../core/utils/supabase_constant.dart';
import '../../Themes/colors.dart';
import 'widgets/add_alert.dart';
import 'widgets/add_milestone.dart';
import 'widgets/bar_chart.dart';
import 'widgets/milestone_tile.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
              onPressed: () => supabase.auth.signOut(),
              child: const Text(
                "Log Out",
                style: TextStyle(color: Colors.redAccent),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            final project = await showDialog<Project>(
              context: context,
              builder: (BuildContext dialogContext) {
                return const AddForm();
              },
            );
            if (project != null) {
              final projectLocal = await supabase
                  .from("project")
                  .insert({
                    ...project.toJson()
                      ..remove("id")
                      ..remove("milestones"),
                    "profiles_id": supabase.auth.currentUser!.id,
                  })
                  .select()
                  .single();

              for (var milestone in project.milestones) {
                await supabase.from("milestone").insert({
                  ...milestone.toJson()..remove("id"),
                  "project_id": projectLocal['id'],
                });
              }

              ref.invalidate(userSupabaseProvider);
            }
          } on PostgrestException catch (e) {
            context.showSnackbarError(e.message);
          }
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ref.watch(userSupabaseProvider).when(
              data: (data) => ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  MyBarChart(projects: data.projects),
                  ...data.projects
                      .map(
                        (project) => ExpansionTile(
                          textColor: Colors.black,
                          collapsedTextColor: project.remaining != 0.0
                              ? Colors.black
                              : Colors.grey,
                          trailing: IconButton(
                            onPressed: () async {
                              try {
                                final data = await showDialog<Project>(
                                  context: context,
                                  builder: (context) =>
                                      AddForm(projectParam: project),
                                );
                                if (data != null) {
                                  await supabase
                                      .from("project")
                                      .update(
                                          data.toJson()..remove("milestones"))
                                      .eq("id", data.id!);
                                  ref.invalidate(userSupabaseProvider);
                                }
                              } on PostgrestException catch (e) {
                                context.showSnackbarError(e.message);
                              }
                            },
                            icon: const Icon(Icons.edit),
                          ),
                          title: Text(
                            project.name,
                            style:
                                Theme.of(context).textTheme.headline3?.copyWith(
                                      color: projectColors[project.status],
                                    ),
                          ),
                          subtitle: Table(
                            children: [
                              TableRow(children: [
                                const Text("Total"),
                                Text(project.total.toString()),
                              ]),
                              TableRow(children: [
                                const Text("Earned"),
                                Text(project.earned.toString()),
                              ]),
                              TableRow(children: [
                                const Text("Remaining"),
                                Text(project.remaining.toString()),
                              ]),
                            ],
                          ),
                          children: [
                            ...project.milestones
                                .asMap()
                                .map(
                                  (index, milestone) => MapEntry(
                                    index,
                                    MilestoneTile(
                                      milestone: milestone,
                                      index: project.id!,
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
                                    final milestone =
                                        await showDialog<Milestone>(
                                      context: context,
                                      builder: (context) => MilestoneDialog(
                                        index: project.id!,
                                      ),
                                    );
                                    if (milestone != null) {
                                      await supabase.from("milestone").insert({
                                        ...milestone.toJson()..remove("id"),
                                        "project_id": project.id!,
                                      });
                                      ref.invalidate(userSupabaseProvider);
                                    }
                                  },
                                  icon: const Icon(Icons.add),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                      .toList(),
                ],
              ),
              error: (error, stackTrace) => Center(child: Text("$error")),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
      ),
    );
  }
}
