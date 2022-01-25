import 'package:flutter/material.dart';
import 'package:persolnal_finance_portifolio/app_widget.dart';
import 'package:persolnal_finance_portifolio/features/home/controller/home_controller.dart';

import 'package:persolnal_finance_portifolio/features/transaction/controller/transaction_controller.dart';
import 'package:provider/provider.dart';

import 'features/balance/controller/balance_controller.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => TransactionController()),
      ChangeNotifierProvider(create: (_) => BalanceController()),
      ChangeNotifierProvider(create: (_) => HomeController())
    ],
    child: const MyApp(),
  ));
}
