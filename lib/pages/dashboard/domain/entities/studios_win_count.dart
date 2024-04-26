import 'package:equatable/equatable.dart';

class StudiosWinCount extends Equatable {
  final String? name;
  final int winCount;

  const StudiosWinCount({required this.name, required this.winCount});

  @override
  List<Object?> get props => [name, winCount];
}
