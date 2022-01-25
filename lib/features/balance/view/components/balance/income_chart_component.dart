import 'package:flutter/material.dart';
import 'package:persolnal_finance_portifolio/features/transaction/controller/transaction_controller.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';

class IncomeChartComponent extends StatefulWidget {
  const IncomeChartComponent({Key? key}) : super(key: key);

  @override
  _IncomeChartComponentState createState() => _IncomeChartComponentState();
}

class _IncomeChartComponentState extends State<IncomeChartComponent> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<TransactionController>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Income',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.blue[800]),
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Planned',
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Real',
                      style: TextStyle(color: Colors.blue[800]),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      '\$${controller.balanceIncomeList.map((e) => e.planned).sum}',
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        '\$${controller.balanceIncomeList.map((e) => e.real).sum}',
                        style: TextStyle(color: Colors.blue[800])),
                  )
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: (controller.balanceIncomeList
                                .map((e) => e.planned)
                                .sum >=
                            controller.balanceIncomeList.map((e) => e.real).sum)
                        ? 200
                        : 200 *
                            (((controller.balanceIncomeList
                                        .map((e) => e.planned)
                                        .sum *
                                    100) /
                                controller.balanceIncomeList
                                    .map((e) => e.real)
                                    .sum)) /
                            100,
                    height: 30,
                    color: Colors.blueGrey,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width:
                        (controller.balanceIncomeList.map((e) => e.real).sum >=
                                controller.balanceIncomeList
                                    .map((e) => e.planned)
                                    .sum)
                            ? 200
                            : 200 *
                                (((controller.balanceIncomeList
                                            .map((e) => e.real)
                                            .sum *
                                        100) /
                                    controller.balanceIncomeList
                                        .map((e) => e.planned)
                                        .sum)) /
                                100,
                    height: 30,
                    color: Colors.blue[800],
                  ),
                )
              ],
            )
          ],
        )
      ],
    );
  }
}
