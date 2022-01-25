import 'package:flutter/material.dart';

import 'package:persolnal_finance_portifolio/features/home/controller/home_controller.dart';
import 'package:persolnal_finance_portifolio/features/home/view/component/select_button.dart';
import 'package:persolnal_finance_portifolio/features/home/view/page/page_select.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomeController>(context);
    return LayoutBuilder(builder: (_, c) {
      return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome to personal finance web app',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 20,
                ),
                TextButton(
                    onPressed: () => controller.openRepo(),
                    child: const Text(
                      'Click here to open the repository link',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ))
              ],
            ),
          ),
          body: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: SelectButton(),
              ),
              Expanded(child: PageSelect(size: c.maxHeight)),
            ],
          ));
    });
  }
}
