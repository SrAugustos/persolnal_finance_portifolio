import 'package:flutter/material.dart';
import 'package:persolnal_finance_portifolio/features/transaction/controller/transaction_controller.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';

class SpendingChartComponent extends StatefulWidget {
  late double size;
  SpendingChartComponent({Key? key, required this.size}) : super(key: key);

  @override
  _SpendingChartComponentState createState() => _SpendingChartComponentState();
}

class _SpendingChartComponentState extends State<SpendingChartComponent> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<TransactionController>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Spending',
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
                      '\$${controller.balanceSpendingList.map((e) => e.planned).sum} ',
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        '\$${controller.balanceSpendingList.map((e) => e.real).sum}',
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
                    width: (controller.balanceSpendingList
                                .map((e) => e.planned)
                                .sum >=
                            controller.balanceSpendingList
                                .map((e) => e.real)
                                .sum)
                        ? 200
                        : 200 *
                            (((controller.balanceSpendingList
                                        .map((e) => e.planned)
                                        .sum *
                                    100) /
                                controller.balanceSpendingList
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
                    width: (controller.balanceSpendingList
                                .map((e) => e.real)
                                .sum >=
                            controller.balanceSpendingList
                                .map((e) => e.planned)
                                .sum)
                        ? 200
                        : 200 *
                            (((controller.balanceSpendingList
                                        .map((e) => e.real)
                                        .sum *
                                    100) /
                                controller.balanceSpendingList
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
