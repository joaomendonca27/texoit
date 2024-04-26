import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:textoit/core/service/http_client.dart';
import 'package:textoit/pages/dashboard/domain/entities/producers.dart';
import 'package:textoit/pages/dashboard/domain/entities/studios_win_count.dart';
import 'package:textoit/pages/dashboard/domain/entities/winner_by_year.dart';
import 'package:textoit/pages/dashboard/domain/entities/years_winners.dart';
import 'package:textoit/pages/dashboard/domain/usecases/dashboard_usecase.dart';
import 'package:textoit/pages/dashboard/presentation/cubit/dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  IDashboardUsecase dashboardUsecase;
  int selectedIndex = 0;
  Producers? pruducersWin;
  List<YearWinners> yearWinner = [];
  List<StudiosWinCount> studiosWinner = [];
  List<WinnerByYear> winnerByYearList = [];
  final yearTextEditingController = TextEditingController();
  DashboardCubit(this.dashboardUsecase) : super(const InitState());
  final htppClient = Modular.get<HttpClient>();
  bool error = false;

  Future<void> yearsWinners() async {
    final result = await dashboardUsecase.yearsWinners();
    if (result is List<YearWinners>) {
      yearWinner = result;
      emit(const SuccessYearsWinnersState());
    } else {
      log(result);
    }
  }

  Future<void> studiosWinCount() async {
    final result = await dashboardUsecase.studiosWinCount();
    if (result is List<StudiosWinCount>) {
      result.sort((a, b) => b.winCount.compareTo(a.winCount));
      studiosWinner = result.take(3).toList();
      emit(const SuccessStudiosWinCountState());
    } else {
      log(result);
    }
  }

  Future<void> pruducersWinInterval() async {
    final result = await dashboardUsecase.pruducersWinInterval();
    if (result is Producers) {
      pruducersWin = result;
      emit(const SuccessPruducersWinIntervalState());
    } else {
      log(result);
    }
  }

  void validateYearFiled() {
    error = yearTextEditingController.text.isEmpty;
  }

  Future<void> winnerByYear() async {
    validateYearFiled();
    if (error) {
      emit(const InitState());
    } else {
      final result = await dashboardUsecase.winnerByYear(
          year: yearTextEditingController.text);
      if (result is List<WinnerByYear>) {
        winnerByYearList = result;
        emit(const SuccessWinnerByYearState());
      } else {
        log(result);
      }
    }
  }
}
