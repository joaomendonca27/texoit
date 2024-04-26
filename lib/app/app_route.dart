import 'package:go_router/go_router.dart';
import 'package:textoit/pages/dashboard/presentation/screens/dashboard_screen.dart';

final routes = GoRouter(routes: [
  GoRoute(path: '/', builder: (context, state) => const DashboardScreen()),
]);
