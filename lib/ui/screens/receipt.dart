import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shormeh_pos/constants.dart';
import 'package:shormeh_pos/data_controller/home_controller.dart';

class Receipt extends ConsumerWidget {
  const Receipt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(dataFuture);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Center(
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Image.asset(
                        'assets/images/logo.png',
                        height: 100,
                      ),
                      Text('Hafouf Branch'),
                      Text(DateTime.now().toString().substring(0, 16)),
                      Text(viewModel.chosenPayment),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 25,
                        width: 150,
                        decoration: BoxDecoration(border: Border.all(width: 2)),
                        child: Center(
                          child: Text(
                            viewModel.chosenOrderMethod!,
                            style: TextStyle(
                                fontSize: size.height * 0.02,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Order Number',
                            style: TextStyle(
                                fontSize: size.height * 0.02,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            height: 30,
                            width: 80,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 2)),
                            child: Center(
                              child: Text(
                                '20',
                                style: TextStyle(
                                    fontSize: size.height * 0.02,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      DataTable(
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 2, color: Colors.black12)),
                        columnSpacing: 0,
                        horizontalMargin: 5,
                        dividerThickness: 2,
                        headingRowHeight: 30,
                        dataRowHeight: 60,
                        columns: const <DataColumn>[
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                'Qty',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic),
                              ),
                            ),
                          ),
                          DataColumn(
                              label: VerticalDivider(
                            color: Colors.black12,
                            thickness: 2,
                          )),
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                'Item',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic),
                              ),
                            ),
                          ),
                          DataColumn(
                              label: VerticalDivider(
                            color: Colors.black12,
                            thickness: 2,
                          )),
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                'Price',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic),
                              ),
                            ),
                          ),
                        ],
                        rows: viewModel.cardItems.map((e) {
                          return DataRow(
                            cells: [
                              DataCell(Center(child: Text(e.count.toString(),  style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),))),
                              DataCell(VerticalDivider(
                                color: Colors.black12,
                                thickness: 2,
                              )),
                              DataCell(
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          e.mainName! + ' ' + e.size!,
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        if (e.drink != '')
                                          Text(
                                            ' + ' + e.drink!,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                      ],
                                    ),
                                    if (e.extra!.isNotEmpty)
                                      Center(
                                        child: Text(
                                          e.extra
                                              .toString()
                                              .replaceAll('[', '')
                                              .replaceAll(']', ''),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      )
                                  ],
                                ),
                              ),
                              DataCell(VerticalDivider(
                                color: Colors.black12,
                                thickness: 2,
                              )),
                              DataCell(Center(
                                  child: Text(
                                e.total.toString() + ' SAR',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ))),
                            ],
                          );
                        }).toList(),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      if (viewModel.amount.text != '' &&
                          viewModel.chosenPayment == 'Cash')
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 75),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: Text(
                                'Paied',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              )),
                              Text(
                                viewModel.amount.text + ' SAR ',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      if (viewModel.amount.text != '' &&
                          viewModel.chosenPayment == 'Cash')
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 75),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: Text(
                                'Remaining',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                              Text(
                                (int.parse(viewModel.amount.text) -
                                            (viewModel.total + viewModel.tax))
                                        .toStringAsFixed(2) +
                                    ' SAR ',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 75),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Text(
                              'Tax',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            )),
                            Text(
                              (viewModel.total*0.14).toStringAsFixed(2) + ' SAR ',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 70),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Container(
                                    height: 25,
                                    padding: EdgeInsets.only(left: 5),
                                    decoration: BoxDecoration(
                                        border: Border.all(width: 1)),
                                    child: Text(
                                      'Total',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ))),
                            Container(
                                height: 25,
                                padding: EdgeInsets.only(left: 5),
                                decoration:
                                    BoxDecoration(border: Border.all(width: 1)),
                                child: Text(
                                  (viewModel.total + viewModel.tax)
                                          .toStringAsFixed(2) +
                                      ' SAR ',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
