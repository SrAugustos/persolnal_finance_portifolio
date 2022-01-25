import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:persolnal_finance_portifolio/features/transaction/controller/transaction_controller.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class IncomeTable extends StatelessWidget {
  const IncomeTable({Key? key}) : super(key: key);

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
              DataColumn(
                  label: Text(
                'Nane',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.blue[800]),
              )),
              DataColumn(
                  label: Text(
                'Date',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.blue[800]),
              )),
              DataColumn(
                  label: Text('Value',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[800]))),
              DataColumn(
                  label: Text('Category',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[800]))),
              DataColumn(
                  label: Text('Delete',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red[800])))
            ],
            rows: controller.transactionList
                .where((element) => element.type == 'Income')
                .map((e) => DataRow(cells: [
                      DataCell(TextFormField(
                        initialValue: e.name,
                        onChanged: (value) => controller.editName(e.id, value),
                      )),
                      DataCell(Text(
                          DateFormat('yyyy-MM-dd').format(e.date).toString())),
                      DataCell(TextFormField(
                        initialValue: e.value.toString(),
                        onChanged: (value) => controller.editValue(e.id, value),
                      )),
                      DataCell(Text(e.category.toString())),
                      DataCell(IconButton(
                          onPressed: () => controller.removeElement(e.id),
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red.withOpacity(0.5),
                          )))
                    ]))
                .toList())
      ],
    );
  }
}
