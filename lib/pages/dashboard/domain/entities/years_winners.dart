import 'package:equatable/equatable.dart';

class YearWinners extends Equatable {
  final int? year;
  final int? winnerCount;

  const YearWinners({required this.year, required this.winnerCount});

  @override
  List<Object?> get props => [year, winnerCount];
}
