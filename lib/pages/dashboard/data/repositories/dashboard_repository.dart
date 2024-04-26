import 'package:dartz/dartz.dart';
import 'package:textoit/core/error/error_core.dart';
import 'package:textoit/core/error/model/erro_model.dart';
import 'package:textoit/pages/dashboard/data/datasource/dashboard_datasource.dart';
import 'package:textoit/pages/dashboard/domain/entities/producers.dart';
import 'package:textoit/pages/dashboard/domain/entities/studios_win_count.dart';
import 'package:textoit/pages/dashboard/domain/entities/winner_by_year.dart';
import 'package:textoit/pages/dashboard/domain/entities/years_winners.dart';
import 'package:textoit/pages/dashboard/domain/services/dashboard_service.dart';

class DashboardRepository implements IDashboardService {
  final IDashboardDatasource datasource;

  DashboardRepository(this.datasource);

  @override
  Future<Either<Failure, Producers>> pruducersWinInterval(String params) async {
    try {
      return right(await datasource.pruducersWinInterval(params));
    } catch (e) {
      if (e is ErrorModelCore) {
        ErrorModelCore error = e;
        return left(error);
      }
      return left(Failure());
    }
  }

  @override
  Future<Either<Failure, List<StudiosWinCount>>> studiosWinCount(
      String params) async {
    try {
      return right(await datasource.studiosWinCount(params));
    } catch (e) {
      if (e is ErrorModelCore) {
        ErrorModelCore error = e;
        return left(error);
      }
      return left(Failure());
    }
  }

  @override
  Future<Either<Failure, List<WinnerByYear>>> winnerByYear(
      String params) async {
    try {
      return right(await datasource.winnerByYear(params));
    } catch (e) {
      if (e is ErrorModelCore) {
        ErrorModelCore error = e;
        return left(error);
      }
      return left(Failure());
    }
  }

  @override
  Future<Either<Failure, List<YearWinners>>> yearsWinners(String params) async {
    try {
      return right(await datasource.yearsWinners(params));
    } catch (e) {
      if (e is ErrorModelCore) {
        ErrorModelCore error = e;
        return left(error);
      }
      return left(Failure());
    }
  }
}
