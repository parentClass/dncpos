import 'package:dncpos/providers/RoutingProvider.dart';
import 'package:dncpos/services/RoutingService.dart';
import 'package:dncpos/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';

class RoutingScreen extends StatefulWidget {
  const RoutingScreen({Key? key}) : super(key: key);

  @override
  _RoutingScreenState createState() => _RoutingScreenState();
}

class _RoutingScreenState extends State<RoutingScreen> {
  List<BottomNavigationBarItem> _buildUpNavigationItems() {
    return const [
      BottomNavigationBarItem(
          icon: Icon(LineIcons.pieChart), label: "Dashboard"),
      BottomNavigationBarItem(
          icon: Icon(LineIcons.calculator), label: "Cashier"),
      BottomNavigationBarItem(icon: Icon(LineIcons.cogs), label: "Settings")
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(kAppTitle), backgroundColor: kCarolinaBlueColor),
      body: LoadingOverlay(
        isLoading: Provider.of<RoutingProvider>(context).isScreenLoading,
        child: PageView(
            controller: Provider.of<RoutingProvider>(context).pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: RoutingService(context: context).bottomRouteList),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5,
          ),
        ]),
        child: BottomNavigationBar(
            selectedFontSize: kNavTitleSelectedFontSize,
            unselectedFontSize: kNavTitleUnselectedFontSize,
            backgroundColor: kCarolinaBlueColor,
            unselectedItemColor: Colors.white,
            selectedItemColor: Colors.black,
            type: BottomNavigationBarType.fixed,
            items: _buildUpNavigationItems(),
            currentIndex: Provider.of<RoutingProvider>(context).pageIndex,
            onTap: (index) => RoutingService.changeScreen(context, index)),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
