import 'package:equatable/equatable.dart';
import 'package:textoit/pages/dashboard/data/models/winner_by_year_model.dart';

class Winners extends Equatable {
  final List<WinnerByYearModel> winners;

  const Winners({required this.winners});

  @override
  List<Object?> get props => [winners];
}
