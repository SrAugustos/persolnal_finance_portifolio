import 'package:flutter/material.dart';
import 'dart:html' as html;

class HomeController extends ChangeNotifier {
  String page = 'Balance';

  selectBalance() {
    page = 'Balance';
    notifyListeners();
  }

  selectTransaction() {
    page = 'Transaction';
    notifyListeners();
  }

  openRepo() {
    html.window.open(
        'https://github.com/SrAugustos/persolnal_finance_portifolio', 'name');
  }
}
