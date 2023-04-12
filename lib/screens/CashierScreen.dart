import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CashierScreen extends StatefulWidget {
  const CashierScreen({super.key});

  // Screen id
  static const String id = "CashierScreen";

  @override
  State<CashierScreen> createState() => _CashierScreenState();
}

class _CashierScreenState extends State<CashierScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
