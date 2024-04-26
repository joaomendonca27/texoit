import 'package:dartz/dartz.dart';
import 'package:textoit/core/error/error_core.dart';
import 'package:textoit/pages/dashboard/domain/entities/producers.dart';
import 'package:textoit/pages/dashboard/domain/entities/studios_win_count.dart';
import 'package:textoit/pages/dashboard/domain/entities/winner_by_year.dart';
import 'package:textoit/pages/dashboard/domain/entities/years_winners.dart';

abstract class IDashboardService {
  Future<Either<Failure, List<YearWinners>>> yearsWinners(String params);
  Future<Either<Failure, List<StudiosWinCount>>> studiosWinCount(String params);
  Future<Either<Failure, Producers>> pruducersWinInterval(String params);
  Future<Either<Failure, List<WinnerByYear>>> winnerByYear(String params);
}
