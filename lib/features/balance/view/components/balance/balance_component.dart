import 'package:flutter/material.dart';

import '../title_component.dart';
import 'balance_resume.dart';
import 'income_balance_table.dart';
import 'income_chart_component.dart';
import 'spending_balance_table.dart';
import 'spending_chart_component.dart';

class BalanceSummary extends StatefulWidget {
  late double size;
  BalanceSummary({required this.size});
  @override
  _BalanceSummaryState createState() => _BalanceSummaryState();
}

class _BalanceSummaryState extends State<BalanceSummary> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          children: [
            TitleWidget(fontSize: widget.size),
            BalanceResumo(size: widget.size),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SpendingChartComponent(
                    size: widget.size,
                  ),
                  SizedBox(
                    width: widget.size * 0.2,
                  ),
                  IncomeChartComponent()
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SpendingBalanceTable(),
                  SizedBox(
                    width: widget.size * 0.2,
                  ),
                  IncomeBalanceTable()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
