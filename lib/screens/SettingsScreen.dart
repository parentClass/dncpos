import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  // Screen id
  static const String id = "SettingsScreen";

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
