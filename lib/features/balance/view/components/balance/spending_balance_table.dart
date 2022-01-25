import 'package:flutter/material.dart';
import 'package:persolnal_finance_portifolio/features/balance/controller/balance_controller.dart';
import 'package:persolnal_finance_portifolio/features/transaction/controller/transaction_controller.dart';

import 'package:provider/provider.dart';
import 'package:collection/collection.dart';

class SpendingBalanceTable extends StatefulWidget {
  const SpendingBalanceTable({Key? key}) : super(key: key);

  @override
  _SpendingBalanceTableState createState() => _SpendingBalanceTableState();
}

class _SpendingBalanceTableState extends State<SpendingBalanceTable> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<TransactionController>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Speding',
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
                      controller.balanceSpendingList
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
                      controller.balanceSpendingList
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
                      (controller.balanceSpendingList
                                  .map((e) => e.planned)
                                  .sum -
                              controller.balanceSpendingList
                                  .map((e) => e.real)
                                  .sum)
                          .toString(),
                      style: const TextStyle(color: Colors.blueGrey),
                    ),
                  )
                ],
              ))
            ],
            rows: controller.balanceSpendingList
                .map<DataRow>((e) => DataRow(cells: [
                      DataCell(Text(e.category)),
                      DataCell(TextFormField(
                        initialValue: e.planned.toString(),
                        onChanged: (value) =>
                            controller.addPlannedSpending(e.category, value),
                      )),
                      DataCell(Text(e.real.toString())),
                      DataCell(Text((e.planned - e.real).toString())),
                    ]))
                .toList())
      ],
    );
  }
}
