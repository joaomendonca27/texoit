import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:textoit/pages/dashboard/domain/entities/winner_by_year.dart';

class WinnerByYearDataSource extends DataGridSource {
  WinnerByYearDataSource({required List<WinnerByYear> winner}) {
    _producers = winner
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<int>(columnName: 'Id', value: e.id),
              DataGridCell<int>(columnName: 'Year', value: e.year),
              DataGridCell<String>(columnName: 'Title', value: e.title),
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
