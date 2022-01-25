import 'package:flutter/material.dart';
import 'package:persolnal_finance_portifolio/features/transaction/controller/transaction_controller.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';

class BalanceResumo extends StatelessWidget {
  double size;
  BalanceResumo({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<TransactionController>(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.blue[800],
                width: 60,
                height: (controller.openingBalance >= controller.finalBalance)
                    ? 250
                    : 250 *
                        ((controller.openingBalance * 100) /
                            controller.finalBalance) /
                        100,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'OPENING BALANCE',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.blue[800],
                    fontWeight: FontWeight.w800),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '\$${controller.openingBalance}',
                style: TextStyle(color: Colors.blue[800]),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 300,
          child: VerticalDivider(
            width: 10,
            color: Colors.black,
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.orange[900],
                width: 60,
                height: (controller.finalBalance >= controller.openingBalance)
                    ? 250
                    : (controller.finalBalance >= 0)
                        ? 250 *
                            (((controller.finalBalance * 100) /
                                    controller.openingBalance) /
                                100)
                        : 0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'FINAL BALANCE',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.orange[900],
                    fontWeight: FontWeight.w800),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('\$${controller.finalBalance}',
                  style: TextStyle(color: Colors.orange[900])),
            )
          ],
        ),
        SizedBox(
          width: size * 0.2,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.blueAccent[100]!.withOpacity(0.3),
          ),
          height: 300,
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${((controller.finalBalance / controller.openingBalance - 1) * 100).toStringAsFixed(2)}%',
                style: TextStyle(
                    color: Colors.blue[800],
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
              const Text('Increase in total economy'),
              const Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Divider(),
              ),
              Text('\$ ${controller.finalBalance - controller.openingBalance}',
                  style: TextStyle(
                      color: Colors.blue[800],
                      fontSize: 40,
                      fontWeight: FontWeight.bold)),
              const Text('Savings of the month')
            ],
          ),
        )
      ],
    );
  }
}
