import 'package:flutter/material.dart';
import 'package:persolnal_finance_portifolio/features/balance/controller/balance_controller.dart';
import 'package:persolnal_finance_portifolio/features/transaction/model/transaction_model.dart';
import 'package:collection/collection.dart';

class TransactionController extends BalanceController {
  late List<TransactionModel> transactionList = [];
  DateTime date = DateTime.now();
  String category = 'Food';
  List<String> categorySpendingList = [
    'Food',
    'Gifts',
    'Health',
    'Housing',
    'Transportation',
    'Staff',
    'Pets',
    'Utilities',
    'Travel',
    'Debt',
    'Savings',
    'Payment',
    'Bonus',
    'Interest',
    'Other'
  ];

  List<String> typeList = ['Spending', 'Income'];
  String type = 'Spending';

  selectCategory(String categorytext) {
    category = categorytext;
    notifyListeners();
  }

  selectType(String typeText) {
    type = typeText;
    notifyListeners();
  }

  addList(String name, String value) {
    transactionList.add(TransactionModel(
        name: name,
        type: type,
        category: category,
        value: double.tryParse(value.replaceAll(',', '.')) ?? 0,
        id: transactionList.length,
        date: date));
    (type == 'Spending')
        ? addRealSpending(category, transactionList.map((e) => e.value).sum)
        : addRealIncome(category, transactionList.map((e) => e.value).sum);
    print(balanceSpendingList.map((e) => e.real));
    notifyListeners();
  }

//Functions to edit

  editName(int id, String name) {
    transactionList.firstWhere((element) => element.id == id).name = name;
    notifyListeners();
  }

  editValue(int id, String value) {
    transactionList.firstWhere((element) => element.id == id).value =
        double.tryParse(value.replaceAll(',', '.')) ?? 0;
    notifyListeners();
  }

  removeElement(int id) {
    transactionList.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
