import 'package:textoit/pages/dashboard/data/models/pruducers_win_interval_model.dart';
import 'package:textoit/pages/dashboard/domain/entities/producers.dart';

class PruducersModel extends Producers {
  const PruducersModel({required super.max, required super.min});

  factory PruducersModel.empty() {
    return const PruducersModel(
      max: [],
      min: [],
    );
  }

  factory PruducersModel.fromJson(Map<String, dynamic> json) {
    List<PruducersWinIntervalModel> listMin = [];
    List<PruducersWinIntervalModel> listMax = [];

    json['min'].forEach((min) {
      listMin.add(PruducersWinIntervalModel.fromJson(min));
    });
    json['max'].forEach((max) {
      listMax.add(PruducersWinIntervalModel.fromJson(max));
    });
    return PruducersModel(min: listMin, max: listMax);
  }
}
