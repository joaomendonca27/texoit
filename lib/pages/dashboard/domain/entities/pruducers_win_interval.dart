import 'package:equatable/equatable.dart';

class PruducersWinInterval extends Equatable {
  final String? producer;
  final int? interval;
  final int? previousWin;
  final int? followingWin;

  const PruducersWinInterval({
    required this.producer,
    required this.interval,
    required this.previousWin,
    required this.followingWin,
  });
  @override
  List<Object?> get props => [producer, interval, previousWin, followingWin];
}
