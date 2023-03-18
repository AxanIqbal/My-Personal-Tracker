import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_personal_tracker/core/extensions/currency.dart';

import '../../../application/models/milestones/milestone.dart';
import '../../../application/provider/providers.dart';
import '../../../core/utils/supabase_constant.dart';
import '../Home/widgets/add_milestone.dart';
import 'widgets/milestone_tile.dart';

class ProjectPage extends HookConsumerWidget {
  const ProjectPage({Key? key, @pathParam required this.projectId})
      : super(key: key);

  final String projectId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProvider = ref.watch(userSupabaseProvider);
    final project = userProvider.whenData((value) => value.projects
        .firstWhere((element) => element.id.toString() == projectId));

    return Scaffold(
      appBar: AppBar(
        title: Text(project.value?.name ?? ""),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              project.value?.remaining.toCompact() ?? "",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(color: Colors.blue),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final milestone = await showDialog<Milestone>(
            context: context,
            builder: (context) => MilestoneDialog(
              index: project.value!.id!,
            ),
          );
          if (milestone != null) {
            await supabase.from("milestone").insert({
              ...milestone.toJson()..remove("id"),
              "project_id": project.value!.id!,
            });
            ref.invalidate(userSupabaseProvider);
          }
        },
        child: const Icon(Icons.add),
      ),
      body: userProvider.when(
        data: (user) {
          project.value!.milestones.sort(
            (a, b) => a.status.index.compareTo(b.status.index),
          );
          return ListView.builder(
            itemCount: project.value!.milestones.length,
            itemBuilder: (context, index) => MilestoneTile(
              milestone: project.value!.milestones[index],
              index: index,
            ),
          );
        },
        error: (error, stackTrace) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Error occured"),
            Text(error.toString()),
          ],
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
