import 'dart:js';

import 'package:flutter/material.dart';
import 'package:persolnal_finance_portifolio/features/balance/controller/balance_controller.dart';
import 'package:persolnal_finance_portifolio/features/transaction/controller/transaction_controller.dart';

import 'package:provider/provider.dart';
import 'package:collection/collection.dart';

class IncomeBalanceTable extends StatelessWidget {
  IncomeBalanceTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<TransactionController>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Income',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.orange[900]),
        ),
        DataTable(
            columns: [
              const DataColumn(
                  label: Text(
                'Totals',
                style: TextStyle(color: Colors.blueGrey),
              )),
              DataColumn(
                  label: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Planned',
                    style: TextStyle(
                        color: Colors.blue[800], fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      controller.balanceIncomeList
                          .map((e) => e.planned)
                          .sum
                          .toString(),
                      style: const TextStyle(color: Colors.blueGrey),
                    ),
                  )
                ],
              )),
              DataColumn(
                  label: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Real',
                    style: TextStyle(
                        color: Colors.blue[800], fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      controller.balanceIncomeList
                          .map((e) => e.real)
                          .sum
                          .toString(),
                      style: const TextStyle(color: Colors.blueGrey),
                    ),
                  )
                ],
              )),
              DataColumn(
                  label: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'difference',
                    style: TextStyle(
                        color: Colors.blue[800], fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      (controller.balanceIncomeList.map((e) => e.planned).sum -
                              controller.balanceIncomeList
                                  .map((e) => e.real)
                                  .sum)
                          .toString(),
                      style: const TextStyle(color: Colors.blueGrey),
                    ),
                  )
                ],
              ))
            ],
            rows: controller.balanceIncomeList
                .map<DataRow>((e) => DataRow(cells: [
                      DataCell(Text(e.category)),
                      DataCell(TextFormField(
                        initialValue: e.planned.toString(),
                        onChanged: (value) =>
                            controller.addPlannedIncome(e.category, value),
                      )),
                      DataCell(Text(e.real.toString())),
                      DataCell(Text((e.planned - e.real).toString())),
                    ]))
                .toList())
      ],
    );
  }
}
