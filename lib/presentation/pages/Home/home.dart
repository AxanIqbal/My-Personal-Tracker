import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_personal_tracker/core/extensions/currency.dart';
import 'package:my_personal_tracker/core/extensions/milestones.dart';
import 'package:my_personal_tracker/core/extensions/snackbars.dart';
import 'package:my_personal_tracker/presentation/routes/app_router.gr.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../application/models/project/project.dart';
import '../../../application/provider/providers.dart';
import '../../../core/utils/supabase_constant.dart';
import '../../Themes/colors.dart';
import 'widgets/add_alert.dart';
import 'widgets/bar_chart.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProvider = ref.watch(userSupabaseProvider);

    return Scaffold(
      appBar: AppBar(
        title: userProvider.maybeWhen(
          data: (data) => Text(
            "Total Remaining: ${data.projects.expand((element) => element.milestones).toList().remainingMoney().toCompact()}",
            style: const TextStyle(color: Colors.blue),
          ),
          orElse: () => null,
        ),
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
        child: userProvider.when(
          data: (data) {
            data.projects.sort(
              (a, b) {
                int cmp = b.remaining.compareTo(a.remaining);
                if (cmp != 0) return cmp;
                return a.status.index.compareTo(b.status.index);
              },
            );
            return Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                MyBarChart(projects: data.projects),
                Expanded(
                  child: ListView.builder(
                    itemCount: data.projects.length,
                    itemBuilder: (context, index) => ListTile(
                      textColor: Colors.black,
                      isThreeLine: true,
                      trailing: IconButton(
                        onPressed: () async {
                          try {
                            final data1 = await showDialog<Project>(
                              context: context,
                              builder: (context) =>
                                  AddForm(projectParam: data.projects[index]),
                            );
                            if (data1 != null) {
                              await supabase
                                  .from("project")
                                  .update(data1.toJson()..remove("milestones"))
                                  .eq("id", data1.id!);
                              ref.invalidate(userSupabaseProvider);
                            }
                          } on PostgrestException catch (e) {
                            context.showSnackbarError(e.message);
                          }
                        },
                        icon: const Icon(Icons.edit),
                      ),
                      title: Text(
                        data.projects[index].name,
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall
                            ?.copyWith(
                              color: projectColors[data.projects[index].status],
                            ),
                      ),
                      subtitle: Table(
                        children: [
                          TableRow(children: [
                            const Text("Total"),
                            Text(data.projects[index].total.toCompact()),
                          ]),
                          TableRow(children: [
                            const Text("Earned"),
                            Text(data.projects[index].earned.toCompact()),
                          ]),
                          TableRow(children: [
                            const Text("Remaining"),
                            Text(data.projects[index].remaining.toCompact()),
                          ]),
                        ],
                      ),
                      onTap: () => context.pushRoute(
                        ProjectRoute(
                          projectId: data.projects[index].id.toString(),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            );
          },
          error: (error, stackTrace) => Center(child: Text("$error")),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
