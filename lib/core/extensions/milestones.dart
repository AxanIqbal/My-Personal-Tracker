import 'package:my_personal_tracker/application/models/milestones/milestone.dart';

import 'date_extension.dart';

extension MilestoneX on List<Milestone> {
  /// Create a new list where we merge cash with the same date and status. with sorting with uploadDate
  /// Useful for charts.
  List<Milestone> removeMergeDuplicate() {
    List<Milestone> data = [];

    forEach((element) {
      final containData = data.indexWhere((dataElement) =>
          element.uploadDate.compareMonth(dataElement.uploadDate) &&
          dataElement.status == element.status);
      if (containData < 0) {
        data.add(element);
      } else {
        data[containData] = data[containData]
            .copyWith(cash: data[containData].cash + element.cash);
      }
    });

    data.sort(
      (a, b) => a.uploadDate.compareTo(b.uploadDate),
    );

    return data;
  }

  List<MilestoneChart> mergeSameDayToChart() {
    List<MilestoneChart> data = [];

    forEach((element) {
      final containData = data.indexWhere((dataElement) =>
          element.uploadDate.compareMonth(dataElement.uploadDate));

      if (containData < 0) {
        data.add(
          MilestoneChart(
            uploadDate: element.uploadDate,
            milestones: [element],
          ),
        );
      } else {
        data[containData].milestones.add(element);
      }
    });

    return data;
  }
}
