import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/models/transactions/transaction.dart';

class TransactionTable extends GetxController {
  final int _currentSortColumn = 0;
  final bool _isSortAsc = true;
  Transaction? transaction;

  SingleChildScrollView dataTable() {
    return SingleChildScrollView(
      child: DataTable(
        columns: createColumns(),
        rows: createRows(),
        sortColumnIndex: _currentSortColumn,
        sortAscending: _isSortAsc,
        dividerThickness: 5,
        dataRowHeight: 80,
        showBottomBorder: true,
        border: TableBorder(borderRadius: BorderRadius.circular(20)),
        // decoration: const BoxDecoration(
        //   color: Colors.white
        // ),
        dataTextStyle: const TextStyle(color: Colors.white),
        headingTextStyle:
            const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        headingRowColor: MaterialStateProperty.resolveWith(
          (states) => Colors.black12,
        ),
      ),
    );
  }


  List<DataColumn> createColumns() {
    return [
      const DataColumn(label: Text('ID')),
      const DataColumn(label: Text('Customer')),
      const DataColumn(label: Text('Invoice No')),
      const DataColumn(label: Text('Sub Total')),
      const DataColumn(label: Text('Tax %')),
      const DataColumn(label: Text('Total')),
      const DataColumn(label: Text('Date')),
    ];
  }

   List<DataRow> createRows() {
    return [
        DataRow(
        cells: [
          DataCell(Text(
            "${transaction?.transId}",
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
          DataCell(Text("${transaction?.payment}")),
          DataCell(Text("120134")),
          DataCell(Text("RM10.00")),
          DataCell(Text("6%")),
          DataCell(Text("RM10.60")),
          DataCell(Text("13/03/2023")),
        ],
      ),
      const DataRow(
        cells: [
          DataCell(Text(
            "02",
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
          DataCell(Text("ONLINE")),
          DataCell(Text("121314")),
          DataCell(Text("RM20.00")),
          DataCell(Text("6%")),
          DataCell(Text("RM21.20")),
          DataCell(Text("14/03/2023")),
        ],
      ),
      const DataRow(
        cells: [
          DataCell(Text(
            "03",
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
          DataCell(Text("CARD")),
          DataCell(Text("151119")),
          DataCell(Text("RM110.00")),
          DataCell(Text("6%")),
          DataCell(Text("RM116.60")),
          DataCell(Text("15/03/2023")),
        ],
      ),
      const DataRow(
        cells: [
          DataCell(Text(
            "04",
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
          DataCell(Text("ONLINE")),
          DataCell(Text("121122")),
          DataCell(Text("RM20.00")),
          DataCell(Text("6%")),
          DataCell(Text("RM21.20")),
          DataCell(Text("15/03/2023")),
        ],
      ),
      const DataRow(
        cells: [
          DataCell(Text(
            "05",
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
          DataCell(Text("ONLINE")),
          DataCell(Text("129034")),
          DataCell(Text("RM20.00")),
          DataCell(Text("6%")),
          DataCell(Text("RM21.20")),
          DataCell(Text("16/03/2023")),
        ],
      ),
      const DataRow(
        cells: [
          DataCell(Text(
            "06",
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
          DataCell(Text("CASH")),
          DataCell(Text("1219023")),
          DataCell(Text("RM20.00")),
          DataCell(Text("6%")),
          DataCell(Text("RM21.20")),
          DataCell(Text("16/03/2023")),
        ],
      ),
      const DataRow(
        cells: [
          DataCell(Text(
            "07",
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
          DataCell(Text("ONLINE")),
          DataCell(Text("123456")),
          DataCell(Text("RM20.00")),
          DataCell(Text("6%")),
          DataCell(Text("RM21.20")),
          DataCell(Text("17/03/2023")),
        ],
      ),
      const DataRow(
        cells: [
          DataCell(Text(
            "08",
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
          DataCell(Text("ONLINE")),
          DataCell(Text("124365")),
          DataCell(Text("RM20.00")),
          DataCell(Text("6%")),
          DataCell(Text("RM21.20")),
          DataCell(Text("18/03/2023")),
        ],
      ),
      const DataRow(
        cells: [
          DataCell(Text(
            "09",
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
          DataCell(Text("CARD")),
          DataCell(Text("128977")),
          DataCell(Text("RM20.00")),
          DataCell(Text("6%")),
          DataCell(Text("RM21.20")),
          DataCell(Text("18/03/2023")),
        ],
      ),
    ];
  }
}
