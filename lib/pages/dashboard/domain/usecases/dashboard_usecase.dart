import 'package:textoit/core/string/string.dart';
import 'package:textoit/pages/dashboard/domain/services/dashboard_service.dart';

abstract class IDashboardUsecase {
  Future<dynamic> yearsWinners();
  Future<dynamic> studiosWinCount();
  Future<dynamic> pruducersWinInterval();
  Future<dynamic> winnerByYear({required String year});
}

class DashboardUsecase implements IDashboardUsecase {
  final IDashboardService dashboardService;
  const DashboardUsecase(this.dashboardService);
  @override
  Future pruducersWinInterval() async {
    final result = await dashboardService
        .pruducersWinInterval(StringTexoIt.pruducersWinInterval);
    final data = result.fold((l) => l, (r) => r);
    return data;
  }

  @override
  Future studiosWinCount() async {
    final result =
        await dashboardService.studiosWinCount(StringTexoIt.studiosWinCount);
    final data = result.fold((l) => l, (r) => r);
    return data;
  }

  @override
  Future yearsWinners() async {
    final result =
        await dashboardService.yearsWinners(StringTexoIt.yearsWinners);
    final data = result.fold((l) => l, (r) => r);
    return data;
  }

  @override
  Future winnerByYear({required String year}) async {
    final result =
        await dashboardService.winnerByYear(StringTexoIt.winnerByYear + year);
    final data = result.fold((l) => l, (r) => r);
    return data;
  }
}
