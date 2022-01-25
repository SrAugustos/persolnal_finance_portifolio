import 'package:flutter/material.dart';
import 'package:persolnal_finance_portifolio/features/home/controller/home_controller.dart';
import 'package:provider/provider.dart';

class SelectButton extends StatelessWidget {
  const SelectButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomeController>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: () => controller.selectBalance(),
            child: const Text('Balance')),
        const SizedBox(
          width: 20,
        ),
        ElevatedButton(
            onPressed: () => controller.selectTransaction(),
            child: const Text('Transactions'))
      ],
    );
  }
}
