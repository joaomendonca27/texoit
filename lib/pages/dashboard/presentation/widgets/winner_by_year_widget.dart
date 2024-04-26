import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:textoit/pages/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:textoit/pages/dashboard/presentation/cubit/dashboard_state.dart';
import 'package:textoit/pages/dashboard/presentation/widgets/winner_by_year.dart';

class WinnerByYearWidget extends StatefulWidget {
  final DashboardCubit dashboardCubit;
  const WinnerByYearWidget({super.key, required this.dashboardCubit});

  @override
  State<WinnerByYearWidget> createState() => _WinnerByYearWidget();
}

class _WinnerByYearWidget extends State<WinnerByYearWidget> {
  @override
  void initState() {
    super.initState();
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
            const Padding(
              padding: EdgeInsets.all(15),
              child: Text('List movie winners by year'),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  // height: 60,
                  width: 390,
                  child: Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: TextFormField(
                      controller:
                          widget.dashboardCubit.yearTextEditingController,
                      style: const TextStyle(decoration: TextDecoration.none),
                      decoration: InputDecoration(
                        hintText: 'Searche by year',
                        errorText: widget.dashboardCubit.error
                            ? 'Favor informar o ano que deseja'
                            : null,
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black.withOpacity(0.5),
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(3.0)),
                        ),
                        errorBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(3.0)),
                          borderSide: BorderSide(color: Colors.red, width: 1),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(9),
                  child: InkWell(
                    child: Container(
                      color: Colors.blue.shade900,
                      height: 30,
                      width: 30,
                    ),
                    onTap: () => widget.dashboardCubit.winnerByYear(),
                  ),
                )
              ],
            ),
            if (state is SuccessWinnerByYearState ||
                widget.dashboardCubit.winnerByYearList.isNotEmpty) ...[
              winnerByYearWidget(
                WinnerByYearDataSource(
                    winner: widget.dashboardCubit.winnerByYearList),
              ),
              SizedBox(
                height: 141,
                child: Container(),
              )
            ] else ...[
              SizedBox(
                height: 279,
                child: Container(),
              )
            ]
          ],
        ),
      ),
    );
  }

  Widget winnerByYearWidget(WinnerByYearDataSource winnerByYearDataSource) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SfDataGrid(
              columnWidthMode: ColumnWidthMode.fill,
              source: winnerByYearDataSource,
              shrinkWrapRows: true,
              columns: [
                GridColumn(
                  columnName: 'Id',
                  label: Container(
                      padding: const EdgeInsets.all(15.0),
                      alignment: Alignment.centerLeft,
                      child: const Text('Id')),
                ),
                GridColumn(
                  columnName: 'Year',
                  label: Container(
                      padding: const EdgeInsets.all(15.0),
                      alignment: Alignment.centerLeft,
                      child: const Text('Year')),
                ),
                GridColumn(
                  columnName: 'Title',
                  label: Container(
                    padding: const EdgeInsets.all(15.0),
                    alignment: Alignment.centerLeft,
                    child: const Text('Title'),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
