import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:textoit/pages/dashboard/domain/entities/years_winners.dart';

class YearWinnerDataSource extends DataGridSource {
  YearWinnerDataSource({required List<YearWinners> yearWinners}) {
    _yearWinners = yearWinners
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<int>(columnName: 'Year', value: e.year),
              DataGridCell<int>(columnName: 'WinCount', value: e.winnerCount),
            ]))
        .toList();
  }

  List<DataGridRow> _yearWinners = [];

  @override
  List<DataGridRow> get rows => _yearWinners;

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
