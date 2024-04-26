import 'package:equatable/equatable.dart';

class WinnerByYear extends Equatable {
  final int? id;
  final int? year;
  final String? title;

  const WinnerByYear({
    required this.id,
    required this.year,
    required this.title,
  });

  @override
  List<Object?> get props => [id, year, title];
}
