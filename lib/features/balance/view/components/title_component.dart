import 'dart:html';

import 'package:flutter/material.dart';
import 'package:persolnal_finance_portifolio/features/transaction/controller/transaction_controller.dart';
import 'package:provider/provider.dart';

class TitleWidget extends StatefulWidget {
  double fontSize;
  TitleWidget({required this.fontSize});

  @override
  _TitleWidgetState createState() => _TitleWidgetState();
}

class _TitleWidgetState extends State<TitleWidget> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<TransactionController>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Monthly budget',
          style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 30,
              color: Colors.orange[900]),
        ),
        SizedBox(width: widget.fontSize * 0.50),
        Text(
          'Opening balance: ',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.blue[900]),
        ),
        Container(
          width: 200,
          color: Colors.red[100]!.withOpacity(0.5),
          child: TextFormField(
            onChanged: (value) => controller.editOpeningBalance(value),
            initialValue: controller.openingBalance.toString(),
            decoration: InputDecoration(
                labelText: 'Enter the value here',
                prefixIcon: Icon(Icons.attach_money, color: Colors.red)),
          ),
        )
      ],
    );
  }
}
