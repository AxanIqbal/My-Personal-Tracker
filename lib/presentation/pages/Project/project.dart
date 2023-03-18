import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_personal_tracker/core/extensions/currency.dart';

import '../../../application/provider/providers.dart';
import 'widgets/milestone_tile.dart';

class ProjectPage extends HookConsumerWidget {
  const ProjectPage({Key? key, @pathParam required this.projectId})
      : super(key: key);

  final String projectId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectProvider = ref.watch(ProjectSupabaseProvider(projectId));

    return Scaffold(
      appBar: AppBar(
        title: projectProvider.whenData((project) => Text(project.name)).value,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: projectProvider
                .whenData(
                  (project) => Text(
                    project.remaining.toCompact(),
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(color: Colors.blue),
                  ),
                )
                .value,
          ),
        ],
      ),
      body: projectProvider.when(
        data: (project) {
          project.milestones.sort(
            (a, b) => a.status.index.compareTo(b.status.index),
          );
          return ListView.builder(
            itemCount: project.milestones.length,
            itemBuilder: (context, index) => MilestoneTile(
              milestone: project.milestones[index],
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
