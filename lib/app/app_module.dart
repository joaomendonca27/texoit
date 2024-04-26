import 'package:flutter_modular/flutter_modular.dart';
import 'package:textoit/core/service/http_client.dart';
import 'package:textoit/pages/dashboard/data/datasource/dashboard_datasource.dart';
import 'package:textoit/pages/dashboard/data/repositories/dashboard_repository.dart';
import 'package:textoit/pages/dashboard/data/request/dashboard_request.dart';
import 'package:textoit/pages/dashboard/domain/services/dashboard_service.dart';
import 'package:textoit/pages/dashboard/domain/usecases/dashboard_usecase.dart';
import 'package:textoit/pages/dashboard/presentation/cubit/dashboard_cubit.dart';

import '../core/service/http_register.dart';
import '../core/service/i_http_service.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.add(() => HttpClient(client: i<HttpSetup>().getInstance()));
    i.add<IHttpService>(HttpClient.new);
    i.add(HttpSetup.new);
    i.add<IDashboardUsecase>(DashboardUsecase.new);
    i.add<IDashboardService>(DashboardRepository.new);
    i.add<IDashboardDatasource>(DashboardRequest.new);
    i.add<DashboardCubit>(DashboardCubit.new);
  }
}
