import 'package:flutter/material.dart';
import 'package:pos/ui/view_models/transaction_table.dart';
import 'package:get/get.dart';
import 'package:pos/ui/widgets/top_menu.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TransactionTable transTable = Get.put(TransactionTable());

    return Column(
      children: [
        Expanded(
          flex: 14,
          child: Column(
            children: [
              TopMenu(title: ' Transaction ', action: Container()
                  //search(),
                  ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xff1f2029),
                  ),
                  child: ListView(
                    children: [
                      transTable.dataTable(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
