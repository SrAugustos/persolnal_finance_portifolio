import 'package:flutter/material.dart';
import 'package:persolnal_finance_portifolio/features/balance/view/components/balance/balance_component.dart';

import 'package:persolnal_finance_portifolio/features/home/controller/home_controller.dart';
import 'package:persolnal_finance_portifolio/features/transaction/view/transaction.dart';
import 'package:provider/provider.dart';

class PageSelect extends StatelessWidget {
  double size;
  PageSelect({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomeController>(context);
    if (controller.page == 'Balance') {
      return SingleChildScrollView(
        child: BalanceSummary(
          size: size,
        ),
      );
    } else {
      return SingleChildScrollView(child: Transaction());
    }
  }
}
