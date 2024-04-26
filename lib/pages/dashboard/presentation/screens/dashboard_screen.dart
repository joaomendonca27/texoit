import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:side_navigation/side_navigation.dart';
import 'package:textoit/pages/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:textoit/pages/dashboard/presentation/widgets/producers_win_widget.dart';
import 'package:textoit/pages/dashboard/presentation/widgets/studios_winner_widget.dart';
import 'package:textoit/pages/dashboard/presentation/widgets/winner_by_year_widget.dart';
import 'package:textoit/pages/dashboard/presentation/widgets/year_winner_widget.dart';
import 'package:textoit/pages/list/presentation/screens/list_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final dashboardCubit = Modular.get<DashboardCubit>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Row(
          children: [
            SideNavigationBar(
              theme: SideNavigationBarTheme(
                backgroundColor: Colors.blueGrey,
                togglerTheme: SideNavigationBarTogglerTheme.standard(),
                itemTheme: SideNavigationBarItemTheme(
                  unselectedItemColor: Colors.black,
                  selectedItemColor: Colors.white,
                ),
                dividerTheme: SideNavigationBarDividerTheme.standard(),
              ),
              selectedIndex: dashboardCubit.selectedIndex,
              footer: const SideNavigationBarFooter(
                label: Text(
                  '®Texo IT Teste',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              items: const [
                SideNavigationBarItem(
                  icon: Icons.dashboard,
                  label: 'Dashboard',
                ),
                SideNavigationBarItem(
                  icon: Icons.list,
                  label: 'List',
                ),
              ],
              onTap: (index) {
                setState(() {
                  dashboardCubit.selectedIndex = index;
                });
              },
            ),
            if (dashboardCubit.selectedIndex == 0) ...[
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 30, 8, 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: YearWinnerWidget(
                                dashboardCubit: dashboardCubit),
                          ),
                          Expanded(
                            child: StudiosWinnerWidget(
                                dashboardCubit: dashboardCubit),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 30, 8, 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ProducersWinWidget(
                                dashboardCubit: dashboardCubit),
                          ),
                          Expanded(
                            child: WinnerByYearWidget(
                                dashboardCubit: dashboardCubit),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ] else
              const Expanded(
                child: ListScreen(),
              ),
          ],
        ),
      ),
    );
  }
}
