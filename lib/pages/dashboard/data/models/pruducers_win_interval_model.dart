import 'package:textoit/pages/dashboard/domain/entities/pruducers_win_interval.dart';

class PruducersWinIntervalModel extends PruducersWinInterval {
  const PruducersWinIntervalModel(
      {required super.producer,
      required super.interval,
      required super.previousWin,
      required super.followingWin});

  factory PruducersWinIntervalModel.empty() {
    return const PruducersWinIntervalModel(
      followingWin: 0,
      interval: 0,
      previousWin: 0,
      producer: '',
    );
  }

  factory PruducersWinIntervalModel.fromJson(Map<String, dynamic> json) {
    return PruducersWinIntervalModel(
      followingWin: json['followingWin'] ?? 0,
      interval: json['interval'] ?? 0,
      previousWin: json['previousWin'] ?? 0,
      producer: json['producer'] ?? '',
    );
  }
}
