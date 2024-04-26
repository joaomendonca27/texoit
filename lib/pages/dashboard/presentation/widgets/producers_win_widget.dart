import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:textoit/pages/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:textoit/pages/dashboard/presentation/cubit/dashboard_state.dart';
import 'package:textoit/pages/dashboard/presentation/widgets/producers_win_interval.dart';

class ProducersWinWidget extends StatefulWidget {
  final DashboardCubit dashboardCubit;
  const ProducersWinWidget({super.key, required this.dashboardCubit});

  @override
  State<ProducersWinWidget> createState() => _ProducersWinWidget();
}

class _ProducersWinWidget extends State<ProducersWinWidget> {
  @override
  void initState() {
    super.initState();
    widget.dashboardCubit.pruducersWinInterval();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: BlocBuilder(
        bloc: widget.dashboardCubit,
        builder: (context, state) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (state is SuccessPruducersWinIntervalState ||
                widget.dashboardCubit.pruducersWin != null) ...[
              const Padding(
                padding: EdgeInsets.all(15),
                child: Text('Top 3 studios with winners'),
              ),
              producerWinWidget(
                ProducerWinMaxIntervalDataSource(
                  producers: widget.dashboardCubit.pruducersWin!.max,
                ),
                'Maximum',
              ),
              producerWinWidget(
                ProducerWinMaxIntervalDataSource(
                    producers: widget.dashboardCubit.pruducersWin!.min),
                'Minimum',
              ),
            ]
          ],
        ),
      ),
    );
  }

  Widget producerWinWidget(
      ProducerWinMaxIntervalDataSource producerWinMaxIntervalDataSource,
      String title) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SfDataGrid(
              columnWidthMode: ColumnWidthMode.fill,
              source: producerWinMaxIntervalDataSource,
              shrinkWrapRows: true,
              columns: [
                GridColumn(
                  columnName: 'Producer',
                  label: Container(
                      padding: const EdgeInsets.all(15.0),
                      alignment: Alignment.centerLeft,
                      child: const Text('Producer')),
                ),
                GridColumn(
                  columnName: 'Interval',
                  label: Container(
                      padding: const EdgeInsets.all(15.0),
                      alignment: Alignment.centerLeft,
                      child: const Text('Interval')),
                ),
                GridColumn(
                  columnName: 'Previous',
                  label: Container(
                      padding: const EdgeInsets.all(15.0),
                      alignment: Alignment.centerLeft,
                      child: const Text('Previous Year')),
                ),
                GridColumn(
                  columnName: 'Following',
                  label: Container(
                      padding: const EdgeInsets.all(15.0),
                      alignment: Alignment.centerLeft,
                      child: const Text('Following Year')),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
