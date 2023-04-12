import 'package:dncpos/providers/RoutingProvider.dart';
import 'package:dncpos/screens/CashierScreen.dart';
import 'package:dncpos/screens/DashboardScreen.dart';
import 'package:dncpos/screens/SettingsScreen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class RoutingService {
  // Constructor
  RoutingService({required this.context});

  // Properties
  BuildContext context;

  /// Retrieve route list
  Map<String, Widget Function(BuildContext)> get routeList {
    // Routes
    return {
      // Dashboard screen
      DashboardScreen.id: (context) => const DashboardScreen(),
      // Cashier screen
      CashierScreen.id: (context) => const CashierScreen(),
      // Setting screen
      SettingsScreen.id: (context) => const SettingsScreen()
    };
  }

  /// Retrieve route list for bottom nav type navigation
  /// Screens listed should be in strict order, since it depends on screen list indexing
  List<Widget> get bottomRouteList {
    // Routes
    return [
      const DashboardScreen(),
      const CashierScreen(),
      const SettingsScreen()
    ];
  }

  // Changes screen to desired screen index with animation
  static void changeScreen(context, index) {
    Provider.of<RoutingProvider>(context, listen: false).setPageIndex(index);
    Provider.of<RoutingProvider>(context, listen: false)
        .pageController
        .jumpToPage(index);
  }

  static void pushScreen(context, Widget w) {
    Navigator.push(context,
        PageTransition(type: PageTransitionType.bottomToTop, child: w));
  }

  static void backToPreviousScreen(context) {
    Navigator.pop(context);
  }
}
