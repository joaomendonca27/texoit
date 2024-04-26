import 'package:textoit/pages/dashboard/domain/entities/winner_by_year.dart';

class WinnerByYearModel extends WinnerByYear {
  const WinnerByYearModel({
    required super.id,
    required super.year,
    required super.title,
  });

  factory WinnerByYearModel.empty() {
    return const WinnerByYearModel(
      year: 0,
      id: 0,
      title: '',
    );
  }

  factory WinnerByYearModel.fromJson(Map<String, dynamic> json) {
    return WinnerByYearModel(
      year: json['year'] ?? 0,
      id: json['id'] ?? 0,
      title: json['title'],
    );
  }
}
