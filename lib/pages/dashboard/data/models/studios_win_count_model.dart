import 'package:textoit/pages/dashboard/domain/entities/studios_win_count.dart';

class StudiosWinCountModel extends StudiosWinCount {
  const StudiosWinCountModel({required super.name, required super.winCount});

  factory StudiosWinCountModel.empty() {
    return const StudiosWinCountModel(name: '', winCount: 0);
  }
  factory StudiosWinCountModel.fromJson(Map<String, dynamic> json) {
    return StudiosWinCountModel(
      name: json['name'] ?? 0,
      winCount: json['winCount'] ?? 0,
    );
  }
}
