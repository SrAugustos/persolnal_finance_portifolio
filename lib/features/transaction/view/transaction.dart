import 'package:flutter/material.dart';
import 'package:persolnal_finance_portifolio/features/transaction/view/components/income_table.dart';
import 'package:persolnal_finance_portifolio/features/transaction/view/components/spending_table.dart';
import 'package:persolnal_finance_portifolio/features/transaction/view/components/transaction_form.dart';

class Transaction extends StatelessWidget {
  const Transaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Column(
          children: [
            TransactionForm(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SpendingTable(),
                SizedBox(
                  width: 100,
                ),
                IncomeTable()
              ],
            )
          ],
        ),
      ),
    );
  }
}
