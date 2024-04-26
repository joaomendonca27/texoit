import 'package:flutter/material.dart';
import 'package:textoit/app/app_route.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Texo IT',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      routerDelegate: routes.routerDelegate,
      routeInformationParser: routes.routeInformationParser,
      routeInformationProvider: routes.routeInformationProvider,
    );
  }
}
