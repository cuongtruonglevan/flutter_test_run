import 'package:flutter/material.dart';
import 'package:flutter_test_run/app/routes/routes.dart';
import 'package:flutter_test_run/app/screens/dashboard_screen/dashboard_screen.dart';
import 'package:flutter_test_run/app/screens/measure_screen/measure_screen.dart';
import 'package:flutter_test_run/app/screens/my_doctor_screen/my_doctor_screen.dart';
import 'package:flutter_test_run/app/screens/profile_screen/profile_screen.dart';
import 'package:flutter_test_run/app/screens/stats_screen/stats_screen.dart';

class AppRouteFactory {
  final navigatorKey = GlobalKey<NavigatorState>();

  Route<dynamic> generateRoute(RouteSettings settings, BuildContext context) {
    // final _arguments = settings.arguments;
    switch (settings.name) {
      case AppRoutes.dashboard:
        return PageRouteBuilder(
            settings: settings,
            pageBuilder: (context, _, __) => DashboardScreen());
        break;
      case AppRoutes.stats:
        return PageRouteBuilder(
            settings: settings, pageBuilder: (context, _, __) => StatsScreen());
        break;
      case AppRoutes.measure:
        return PageRouteBuilder(
            settings: settings,
            pageBuilder: (context, _, __) => MeasureScreen());
        break;
      case AppRoutes.myDoctor:
        return PageRouteBuilder(
            settings: settings,
            pageBuilder: (context, _, __) => MyDoctorScreen());
        break;
      case AppRoutes.profile:
        return PageRouteBuilder(
            settings: settings,
            pageBuilder: (context, _, __) => ProfileScreen());
        break;
      default:
        break;
    }
    return _buildUnknownRoute(
      context,
    );
  }

  Route<dynamic> _buildUnknownRoute(BuildContext context) => PageRouteBuilder(
        pageBuilder: (context, _, __) => Scaffold(
          body: Container(
            child: Center(
              child: Text('Unknown route'),
            ),
          ),
        ),
      );
}
