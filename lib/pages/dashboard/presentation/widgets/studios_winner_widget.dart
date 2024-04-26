import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:textoit/pages/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:textoit/pages/dashboard/presentation/cubit/dashboard_state.dart';
import 'package:textoit/pages/dashboard/presentation/widgets/studios_winner_data_grid_widget.dart';

class StudiosWinnerWidget extends StatefulWidget {
  final DashboardCubit dashboardCubit;
  const StudiosWinnerWidget({super.key, required this.dashboardCubit});

  @override
  State<StudiosWinnerWidget> createState() => _StudiosWinnerWidget();
}

class _StudiosWinnerWidget extends State<StudiosWinnerWidget> {
  @override
  void initState() {
    super.initState();
    widget.dashboardCubit.studiosWinCount();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: BlocBuilder(
        bloc: widget.dashboardCubit,
        builder: (context, state) => Column(
          children: [
            if (state is SuccessStudiosWinCountState ||
                widget.dashboardCubit.studiosWinner.isNotEmpty) ...[
              studiosWinnerWidget(StudiosWinnerDataSource(
                  yearWinners: widget.dashboardCubit.studiosWinner)),
            ]
          ],
        ),
      ),
    );
  }

  Widget studiosWinnerWidget(StudiosWinnerDataSource studiosWinnerDataSource) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Column(
        children: [
          const Text('Top 3 studios with winners'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SfDataGrid(
              columnWidthMode: ColumnWidthMode.fill,
              source: studiosWinnerDataSource,
              shrinkWrapRows: true,
              columns: [
                GridColumn(
                  columnName: 'Name',
                  label: Container(
                      padding: const EdgeInsets.all(15.0),
                      alignment: Alignment.centerLeft,
                      child: const Text('Name')),
                ),
                GridColumn(
                  columnName: 'WinCount',
                  label: Container(
                      padding: const EdgeInsets.all(15.0),
                      alignment: Alignment.centerLeft,
                      child: const Text('Win Count')),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
