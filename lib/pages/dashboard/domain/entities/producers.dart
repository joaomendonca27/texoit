import 'package:equatable/equatable.dart';
import 'package:textoit/pages/dashboard/data/models/pruducers_win_interval_model.dart';

class Producers extends Equatable {
  final List<PruducersWinIntervalModel> min;
  final List<PruducersWinIntervalModel> max;

  const Producers({required this.max, required this.min});

  @override
  List<Object?> get props => [min, max];
}
