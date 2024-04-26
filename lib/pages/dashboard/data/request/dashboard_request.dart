import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:textoit/core/error/model/erro_model.dart';
import 'package:textoit/core/service/http_client.dart';
import 'package:textoit/pages/dashboard/data/datasource/dashboard_datasource.dart';
import 'package:textoit/pages/dashboard/data/models/producers_model.dart';
import 'package:textoit/pages/dashboard/data/models/studios_win_count_model.dart';
import 'package:textoit/pages/dashboard/data/models/winner_by_year_model.dart';
import 'package:textoit/pages/dashboard/data/models/years_winners_model.dart';

class DashboardRequest implements IDashboardDatasource {
  final HttpClient httpClient;
  DashboardRequest(this.httpClient);

  @override
  Future<PruducersModel> pruducersWinInterval(String params) async {
    try {
      final response = await httpClient.get(HttpClient.baseUrl + params);
      final jsonResult = response;
      log('RESPONSE ----> $jsonResult');
      return PruducersModel.fromJson(jsonResult);
    } on DioException catch (e) {
      var error = e.response?.data;
      ErrorModelCore errorModel = ErrorModelCore(
        status: error['status'],
        message: error['message'],
      );
      log('ERROR LOGIN MESSAGE ----> ${errorModel.message}');
      throw errorModel;
    }
  }

  @override
  Future<List<StudiosWinCountModel>> studiosWinCount(String params) async {
    try {
      final response = await httpClient.get(HttpClient.baseUrl + params);
      List<StudiosWinCountModel> list = [];
      final jsonResult = response;
      log('RESPONSE ----> $jsonResult');
      jsonResult['studios'].forEach((winners) {
        list.add(StudiosWinCountModel.fromJson(winners));
      });
      return list;
    } on DioException catch (e) {
      var error = e.response?.data;
      ErrorModelCore errorModel = ErrorModelCore(
        status: error['status'],
        message: error['message'],
      );
      log('ERROR LOGIN MESSAGE ----> ${errorModel.message}');
      throw errorModel;
    }
  }

  @override
  Future<List<WinnerByYearModel>> winnerByYear(String params) async {
    try {
      final response = await httpClient.get(HttpClient.baseUrl + params);
      List<WinnerByYearModel> list = [];
      final jsonResult = response;
      log('RESPONSE ----> $jsonResult');
      jsonResult.forEach((winners) {
        list.add(WinnerByYearModel.fromJson(winners));
      });
      return list;
    } on DioException catch (e) {
      var error = e.response?.data;
      ErrorModelCore errorModel = ErrorModelCore(
        status: error['status'],
        message: error['message'],
      );
      log('ERROR LOGIN MESSAGE ----> ${errorModel.message}');
      throw errorModel;
    }
  }

  @override
  Future<List<YearWinnersModel>> yearsWinners(String params) async {
    try {
      final response = await httpClient.get(HttpClient.baseUrl + params);
      List<YearWinnersModel> list = [];
      final jsonResult = response;
      log('RESPONSE ----> $jsonResult');
      jsonResult['years'].forEach((winners) {
        list.add(YearWinnersModel.fromJson(winners));
      });
      return list;
    } on DioException catch (e) {
      var error = e.response?.data;
      ErrorModelCore errorModel = ErrorModelCore(
        status: error['status'],
        message: error['message'],
      );
      log('ERROR LOGIN MESSAGE ----> ${errorModel.message}');
      throw errorModel;
    }
  }
}
