import 'package:flutter/material.dart';
import 'package:persolnal_finance_portifolio/features/balance/models/balance_speding_model.dart';
import 'package:persolnal_finance_portifolio/features/transaction/controller/transaction_controller.dart';

import 'package:collection/collection.dart';
import 'package:provider/provider.dart';

class BalanceController extends ChangeNotifier {
  double openingBalance = 0;
  late double finalBalance = 0;
  List<BalanceModel> balanceSpendingList = [
    BalanceModel(category: 'Food', planned: 0, real: 0),
    BalanceModel(category: 'Gifts', planned: 0, real: 0),
    BalanceModel(category: 'Health', planned: 0, real: 0),
    BalanceModel(category: 'Housing', planned: 0, real: 0),
    BalanceModel(category: 'Transportation', planned: 0, real: 0),
    BalanceModel(category: 'Staff', planned: 0, real: 0),
    BalanceModel(category: 'Pets', planned: 0, real: 0),
    BalanceModel(category: 'Utilities', planned: 0, real: 0),
    BalanceModel(category: 'Travel', planned: 0, real: 0),
    BalanceModel(category: 'Debt', planned: 0, real: 0),
  ];
  List<BalanceModel> balanceIncomeList = [
    BalanceModel(category: 'Savings', planned: 0, real: 0),
    BalanceModel(category: 'Payment', planned: 0, real: 0),
    BalanceModel(category: 'Bonus', planned: 0, real: 0),
    BalanceModel(category: 'Interest', planned: 0, real: 0),
    BalanceModel(category: 'Other', planned: 0, real: 0),
  ];
  addRealSpending(String category, double real) {
    balanceSpendingList
        .firstWhere((element) => element.category == category)
        .real = real;
    _calcFinal();
    //notifyListeners();
  }

  addRealIncome(String category, double real) {
    balanceIncomeList
        .firstWhere((element) => element.category == category)
        .real = real;
    _calcFinal();
    //notifyListeners();
  }

  addPlannedIncome(String category, String planned) {
    balanceIncomeList
        .firstWhere((element) => element.category == category)
        .planned = double.tryParse(planned.replaceAll(',', '.')) ?? 0;
    _calcFinal();
    notifyListeners();
  }

  addPlannedSpending(String category, String planned) {
    balanceSpendingList
        .firstWhere((element) => element.category == category)
        .planned = double.tryParse(planned.replaceAll(',', '.')) ?? 0;
    _calcFinal();
    notifyListeners();
  }

  editBalance(String category, String value) {
    balanceSpendingList
        .firstWhere((element) => element.category == category)
        .planned = double.tryParse(value.replaceAll(',', '.')) ?? 0;
    _calcFinal();
  }

  editOpeningBalance(String value) {
    openingBalance = double.tryParse(value.replaceAll(',', '.')) ?? 0;
    _calcFinal();
    notifyListeners();
  }

  _calcFinal() {
    finalBalance = openingBalance +
        balanceIncomeList.map((e) => e.real).sum -
        balanceSpendingList.map((e) => e.real).sum;
    notifyListeners();
  }
}
