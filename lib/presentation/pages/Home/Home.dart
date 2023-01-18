import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:my_personal_tracker/core/extensions/milestones.dart';

import '../../../application/models/milestones/milestone.dart';
import '../../../application/models/project/project.dart';
import '../../../application/provider/providers.dart';
import '../../../core/utils/firebase_constants.dart';
import '../../Themes/colors.dart';
import 'widgets/add_alert.dart';
import 'widgets/add_milestone.dart';
import 'widgets/milestone_tile.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = FirebaseAuth.instance.currentUser;
    final userProvider = ref.watch(userNotifierProvider);
    final userNotifier = ref.read(userNotifierProvider.notifier);
    final dataChart = userProvider.projects
        .expand(
          (e) => e.milestones,
        )
        .toList()
        .removeMergeDuplicate()
        .mergeSameDayToChart();

    useEffect(() {
      final subs = usersProject.doc(user?.uid).snapshots().listen((event) {
        userNotifier.upgradeUser(event.data()!);
      });

      return () => subs.cancel();
    }, []);

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
              onPressed: () => FirebaseAuth.instance.signOut(),
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
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                height: 300,
                width: dataChart.length * 60,
                child: BarChart(
                  BarChartData(
                    titlesData: FlTitlesData(
                      topTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: false,
                        ),
                      ),
                      rightTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: false,
                        ),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) => Text(
                            DateFormat("yy/MM").format(
                              DateTime.fromMillisecondsSinceEpoch(
                                value.toInt(),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    barGroups: dataChart
                        .map(
                          (e) => BarChartGroupData(
                            x: e.uploadDate.millisecondsSinceEpoch,
                            barRods: e.milestones
                                .map(
                                  (e1) => BarChartRodData(
                                    toY: e1.cash,
                                    color: milestoneColors[e1.status],
                                  ),
                                )
                                .toList(),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ),
            ...userProvider.projects
                .asMap()
                .map(
                  (projectIndex, project) => MapEntry(
                    projectIndex,
                    ExpansionTile(
                      textColor: Colors.black,
                      collapsedTextColor:
                          project.remaining != 0.0 ? Colors.black : Colors.grey,
                      trailing: IconButton(
                        onPressed: () async {
                          final data = await showDialog(
                            context: context,
                            builder: (context) =>
                                AddForm(projectParam: project),
                          );
                          userNotifier.updateProject(projectIndex, data);
                          await userNotifier.toFirebase();
                        },
                        icon: const Icon(Icons.edit),
                      ),
                      title: Text(
                        project.name,
                        style: Theme.of(context).textTheme.headline3?.copyWith(
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
                                  userNotifier.addProjectMilestone(
                                      projectIndex, milestone);
                                  await userNotifier.toFirebase();
                                }
                              },
                              icon: const Icon(Icons.add),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
                .values
                .toList()
          ],
        ),
      ),
    );
  }
}
