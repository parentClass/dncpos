import 'package:bot_toast/bot_toast.dart';
import 'package:dncpos/providers/RoutingProvider.dart';
import 'package:dncpos/screens/RoutingScreen.dart';
import 'package:dncpos/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft])
      .then((value) => {runApp(DncPosApp())});
}

class DncPosApp extends StatelessWidget {
  DncPosApp({Key? key}) : super(key: key);

  final List<ChangeNotifierProvider> _appProviders = [
    ChangeNotifierProvider<RoutingProvider>(create: (_) => RoutingProvider())
  ];

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: _appProviders,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: kAppTitle,
        home: const RoutingScreen(),
        builder: BotToastInit(),
        navigatorObservers: [BotToastNavigatorObserver()],
      ),
    );
  }
}
