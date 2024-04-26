import 'package:textoit/pages/dashboard/domain/entities/years_winners.dart';

class YearWinnersModel extends YearWinners {
  const YearWinnersModel({required super.year, required super.winnerCount});

  factory YearWinnersModel.empty() {
    return const YearWinnersModel(year: 0, winnerCount: 0);
  }

  factory YearWinnersModel.fromJson(Map<String, dynamic> json) {
    return YearWinnersModel(
        year: json['year'] ?? 0, winnerCount: json['winnerCount'] ?? 0);
  }
}
