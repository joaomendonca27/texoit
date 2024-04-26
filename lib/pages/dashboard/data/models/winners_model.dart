import 'package:textoit/pages/dashboard/data/models/winner_by_year_model.dart';
import 'package:textoit/pages/dashboard/domain/entities/winners.dart';

class WinnersModel extends Winners {
  const WinnersModel({required super.winners});

  factory WinnersModel.empty() {
    return const WinnersModel(winners: []);
  }

  factory WinnersModel.fromJson(List<dynamic> json) {
    List<WinnerByYearModel> listWinners = [];

    for (var win in json) {
      listWinners.add(WinnerByYearModel.fromJson(win));
    }

    return WinnersModel(winners: listWinners);
  }
}
