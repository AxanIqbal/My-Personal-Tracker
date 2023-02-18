import 'package:my_personal_tracker/application/models/milestones/milestone.dart';

import 'date_extension.dart';

extension MilestoneX on List<Milestone> {
  /// Create a new list where we merge cash with the same date and status. with sorting with uploadDate
  /// Useful for charts.
  List<Milestone> removeMergeDuplicate() {
    List<Milestone> data = [];

    forEach((element) {
      final containData = data.indexWhere((dataElement) =>
          element.updateAt.compareMonth(dataElement.updateAt) &&
          dataElement.status == element.status);
      if (containData < 0) {
        data.add(element);
      } else {
        data[containData] = data[containData]
            .copyWith(cash: data[containData].cash + element.cash);
      }
    });

    data.sort(
      (a, b) => a.updateAt.compareTo(b.updateAt),
    );

    return data;
  }

  List<MilestoneChart> mergeSameDayToChart() {
    List<MilestoneChart> data = [];

    forEach((element) {
      final containData = data.indexWhere((dataElement) =>
          element.updateAt.compareMonth(dataElement.uploadDate));

      if (containData < 0) {
        data.add(
          MilestoneChart(
            uploadDate: element.updateAt,
            milestones: [element],
          ),
        );
      } else {
        data[containData].milestones.add(element);
      }
    });

    return data;
  }

  double remainingMoney() {
    double remaining = 0.0;
    forEach(
      (element) {
        if (element.status == MilestoneStatus.Pending) {
          print("remaining: $remaining and milestone to add: ${element.cash}");
          remaining += element.cash;
        }
      },
    );

    return remaining;
  }
}
