import 'package:textoit/pages/dashboard/data/models/producers_model.dart';
import 'package:textoit/pages/dashboard/data/models/studios_win_count_model.dart';
import 'package:textoit/pages/dashboard/data/models/winner_by_year_model.dart';
import 'package:textoit/pages/dashboard/data/models/years_winners_model.dart';

abstract class IDashboardDatasource {
  Future<List<YearWinnersModel>> yearsWinners(String params);
  Future<List<StudiosWinCountModel>> studiosWinCount(String params);
  Future<PruducersModel> pruducersWinInterval(String params);
  Future<List<WinnerByYearModel>> winnerByYear(String params);
}
