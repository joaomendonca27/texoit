import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:textoit/pages/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:textoit/pages/dashboard/presentation/cubit/dashboard_state.dart';
import 'package:textoit/pages/dashboard/presentation/widgets/year_winner_data_grid_widget.dart';

class YearWinnerWidget extends StatefulWidget {
  final DashboardCubit dashboardCubit;
  const YearWinnerWidget({super.key, required this.dashboardCubit});

  @override
  State<YearWinnerWidget> createState() => _YearWinnerWidget();
}

class _YearWinnerWidget extends State<YearWinnerWidget> {
  @override
  void initState() {
    super.initState();
    widget.dashboardCubit.yearsWinners();
  }

  @override
  Widget build(BuildContext context) {
    bool show = false;
    return PopScope(
      canPop: false,
      child: BlocBuilder(
        bloc: widget.dashboardCubit,
        builder: (context, state) => Column(
          children: [
            if (state is SuccessYearsWinnersState ||
                widget.dashboardCubit.yearWinner.isNotEmpty) ...[
              yearWinnerWidget(
                YearWinnerDataSource(
                  yearWinners: widget.dashboardCubit.yearWinner,
                ),
                show,
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget yearWinnerWidget(
      YearWinnerDataSource yearWinnerDataSource, bool show) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Column(
        children: [
          const Text('List years with multiple winners'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SfDataGrid(
              columnWidthMode: ColumnWidthMode.fill,
              source: yearWinnerDataSource,
              shrinkWrapRows: true,
              columns: [
                GridColumn(
                  columnName: 'Year',
                  label: Container(
                      padding: const EdgeInsets.all(15.0),
                      alignment: Alignment.centerLeft,
                      child: const Text('Year')),
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
