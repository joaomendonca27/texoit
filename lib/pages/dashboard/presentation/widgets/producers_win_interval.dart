import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:textoit/pages/dashboard/data/models/pruducers_win_interval_model.dart';

class ProducerWinMaxIntervalDataSource extends DataGridSource {
  ProducerWinMaxIntervalDataSource(
      {required List<PruducersWinIntervalModel> producers}) {
    _producers = producers
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'Producer', value: e.producer),
              DataGridCell<int>(columnName: 'Interval', value: e.interval),
              DataGridCell<int>(columnName: 'Previous', value: e.previousWin),
              DataGridCell<int>(columnName: 'Following', value: e.followingWin),
            ]))
        .toList();
  }

  List<DataGridRow> _producers = [];

  @override
  List<DataGridRow> get rows => _producers;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>(
        (dataGridCell) {
          return Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(15.0),
            child: Text(dataGridCell.value.toString()),
          );
        },
      ).toList(),
    );
  }
}
