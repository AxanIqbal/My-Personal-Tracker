import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_personal_tracker/application/models/project/project.dart';
import 'package:my_personal_tracker/core/extensions/milestones.dart';

import '../../../Themes/colors.dart';

class MyBarChart extends StatelessWidget {
  const MyBarChart({Key? key, required this.projects}) : super(key: key);

  final List<Project> projects;

  @override
  Widget build(BuildContext context) {
    final dataChart = projects
        .expand(
          (e) => e.milestones,
        )
        .toList()
        .removeMergeDuplicate()
        .mergeSameDayToChart();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        height: 300,
        width: dataChart.length * 60,
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: BarChart(
            BarChartData(
              titlesData: FlTitlesData(
                topTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: false,
                  ),
                ),
                // rightTitles: AxisTitles(
                //   sideTitles: SideTitles(
                //     showTitles: false,
                //   ),
                // ),
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
    );
  }
}
