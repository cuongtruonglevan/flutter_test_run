import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test_run/app/routes/routes.dart';
import 'package:flutter_test_run/app/routes/routes_factory.dart';
import 'package:flutter_test_run/shared/app_colors.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final RxInt _selectedIndex = 0.obs;

  final _bottomBarItems = [
    BottomBarItem(Icons.dashboard, 'Dashboard'),
    BottomBarItem(Icons.bar_chart, 'Stats'),
    BottomBarItem(Icons.timer, 'Measure'),
    BottomBarItem(Icons.account_tree, 'My Doctor'),
    BottomBarItem(Icons.person, 'Profile'),
  ];

  final _homeStacks = [
    AppRoutes.dashboard,
    AppRoutes.stats,
    AppRoutes.measure,
    AppRoutes.myDoctor,
    AppRoutes.profile,
  ];

  AppRouteFactory _routeFactory;

  GlobalKey<NavigatorState> get _navigatorKey => _routeFactory.navigatorKey;

  @override
  void initState() {
    super.initState();
    _routeFactory = AppRouteFactory();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: _buildBody(context),
        bottomNavigationBar: _buildBottomNavigationBar(),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Navigator(
      key: _routeFactory.navigatorKey,
      onGenerateRoute: (settings) =>
          _routeFactory.generateRoute(settings, context),
      initialRoute: AppRoutes.dashboard,
    );
  }

  Widget _buildBottomNavigationBar() {
    return Obx(() {
      return BottomNavigationBar(
        currentIndex: _selectedIndex.value,
        items: _bottomBarItems
            .map((item) => _buildBottomBarItem(item.icon, item.label))
            .toList(),
        onTap: (index) {
          if (_selectedIndex.value != index) {
            _selectedIndex.value = index;
            _navigateTo(_homeStacks[index]);
          }
        },
        showUnselectedLabels: true,
        selectedItemColor: AppColors.secondaryColor,
        unselectedItemColor: AppColors.textDefaultColor,
      );
    });
  }

  BottomNavigationBarItem _buildBottomBarItem(IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: AppColors.textDefaultColor,
      ),
      activeIcon: Icon(
        icon,
        color: AppColors.secondaryColor,
      ),
      label: label,
    );
  }

  void _navigateTo(String route) {
    _navigatorKey.currentState.pushReplacementNamed(route);
  }
}

class BottomBarItem {
  final IconData icon;
  final String label;

  BottomBarItem(this.icon, this.label);
}
