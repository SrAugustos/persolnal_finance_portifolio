import 'package:flutter/material.dart';
import 'package:persolnal_finance_portifolio/features/transaction/controller/transaction_controller.dart';
import 'package:provider/provider.dart';

class TransactionForm extends StatefulWidget {
  const TransactionForm({Key? key}) : super(key: key);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  @override
  Widget build(BuildContext context) {
    TextEditingController value = TextEditingController();
    TextEditingController name = TextEditingController();
    final controller = Provider.of<TransactionController>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Select type:',
          style:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.blue[800]),
        ),
        const SizedBox(
          width: 10,
        ),
        DropdownButton(
            items: controller.typeList
                .map((e) => DropdownMenuItem(
                      child: Text(
                        e,
                        style: TextStyle(color: Colors.blueGrey),
                      ),
                      value: e,
                    ))
                .toList(),
            value: controller.type,
            onChanged: (String? value) => controller.selectType(value!)),
        const SizedBox(
          width: 10,
        ),
        Text(
          'Select a category:',
          style:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.blue[800]),
        ),
        const SizedBox(
          width: 10,
        ),
        DropdownButton(
            items: controller.categorySpendingList
                .map((e) => DropdownMenuItem(
                      child: Text(
                        e,
                        style: const TextStyle(color: Colors.blueGrey),
                      ),
                      value: e,
                    ))
                .toList(),
            value: controller.category,
            onChanged: (String? value) => controller.selectCategory(value!)),
        const SizedBox(
          width: 10,
        ),
        Text(
          'Enter the name here:',
          style:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.blue[800]),
        ),
        const SizedBox(
          width: 10,
        ),
        SizedBox(
          width: 100,
          child: TextFormField(
            controller: name,
            decoration: InputDecoration(
                labelText: 'Name',
                prefix: Icon(Icons.attach_money, color: Colors.blue[800])),
          ),
        ),
        Text(
          'Enter the value here:',
          style:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.blue[800]),
        ),
        const SizedBox(
          width: 10,
        ),
        SizedBox(
          width: 100,
          child: TextFormField(
            controller: value,
            decoration: InputDecoration(
                labelText: 'Value',
                prefix: Icon(Icons.attach_money, color: Colors.blue[800])),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        OutlinedButton(
            onPressed: () => controller.addList(name.text, value.text),
            child: Text('Add'))
      ],
    );
  }
}
