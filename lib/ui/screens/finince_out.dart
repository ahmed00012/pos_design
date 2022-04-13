import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shormeh_pos/data_controller/finance_controller.dart';
import 'package:shormeh_pos/ui/screens/home.dart';
import 'package:shormeh_pos/ui/screens/login.dart';

import '../../constants.dart';

class FinanceOut extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(financeFuture);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    viewModel.visaCashSwap(0);
                  },
                  child: Container(
                      width: size.width * 0.4,
                      height: size.height * 0.08,
                      padding: EdgeInsets.symmetric(
                        horizontal: 30,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: viewModel.chosenCash
                                  ? Constants.mainColor
                                  : Colors.black38,
                              width: 2)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Cash',
                            style: TextStyle(
                                fontSize: size.height * 0.03,
                                color: viewModel.chosenCash
                                    ? Constants.mainColor
                                    : Colors.black38,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            viewModel.cashIn.isEmpty
                                ? '0.0'
                                : viewModel.cashIn.join(),
                            style: TextStyle(
                                fontSize: size.height * 0.03,
                                color: viewModel.chosenCash
                                    ? Constants.mainColor
                                    : Colors.black38,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    viewModel.visaCashSwap(1);
                  },
                  child: Container(
                      width: size.width * 0.4,
                      height: size.height * 0.08,
                      padding: EdgeInsets.symmetric(
                        horizontal: 30,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: viewModel.chosenVisa
                                  ? Constants.mainColor
                                  : Colors.black38,
                              width: 2)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Visa',
                            style: TextStyle(
                                fontSize: size.height * 0.03,
                                color: viewModel.chosenVisa
                                    ? Constants.mainColor
                                    : Colors.black38,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            viewModel.visaIn.isEmpty
                                ? '0.0'
                                : viewModel.visaIn.join(),
                            style: TextStyle(
                                fontSize: size.height * 0.03,
                                color: viewModel.chosenVisa
                                    ? Constants.mainColor
                                    : Colors.black38,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                ),
                SizedBox(
                  height: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 80,
                        width: 370,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Stack(
                          children: [
                            Center(
                              child: Text(
                                viewModel.chosenCash
                                    ? viewModel.cashIn.join()
                                    : viewModel.visaIn.join(),
                                style: TextStyle(fontSize: size.height * 0.025),
                              ),
                            ),
                            Positioned(
                                right: 0,
                                child: InkWell(
                                    onTap: () {
                                      viewModel.removeNumber();
                                      print(viewModel.visaIn);
                                    },
                                    child: Container(
                                      height: 80,
                                      width: 60,
                                      color: Colors.red[500],
                                      child: Icon(
                                        Icons.backspace_outlined,
                                        size: size.height * 0.04,
                                        color: Colors.white,
                                      ),
                                    )))
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [1, 2, 3]
                          .map((e) => InkWell(
                                onTap: () {
                                  viewModel.addNumber(e.toString());
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                    height: 80,
                                    width: 120,
                                    color: Colors.white,
                                    child: Center(
                                      child: Text(
                                        e.toString(),
                                        style: TextStyle(
                                            fontSize: size.height * 0.025),
                                      ),
                                    ),
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [4, 5, 6]
                          .map((e) => InkWell(
                                onTap: () {
                                  viewModel.addNumber(e.toString());
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                    height: 80,
                                    width: 120,
                                    color: Colors.white,
                                    child: Center(
                                      child: Text(
                                        e.toString(),
                                        style: TextStyle(
                                            fontSize: size.height * 0.025),
                                      ),
                                    ),
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [7, 8, 9]
                          .map((e) => InkWell(
                                onTap: () {
                                  viewModel.addNumber(e.toString());
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                    height: 80,
                                    width: 120,
                                    color: Colors.white,
                                    child: Center(
                                      child: Text(
                                        e.toString(),
                                        style: TextStyle(
                                            fontSize: size.height * 0.025),
                                      ),
                                    ),
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            viewModel.addNumber('.');
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              height: 80,
                              width: 120,
                              color: Colors.white,
                              child: Center(
                                child: Text(
                                  '.'.toString(),
                                  style:
                                      TextStyle(fontSize: size.height * 0.03),
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            viewModel.addNumber('0');
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              height: 80,
                              width: 120,
                              color: Colors.white,
                              child: Center(
                                child: Text(
                                  '0',
                                  style:
                                      TextStyle(fontSize: size.height * 0.025),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: InkWell(
                            onTap: () {
                              if (viewModel.chosenCash)
                                viewModel.cashInDone();
                              else
                                viewModel.visaInDone();
                            },
                            child: Container(
                              height: 80,
                              width: 120,
                              color: Colors.green,
                              child: Center(
                                child: Icon(
                                  Icons.check,
                                  size: size.height * 0.025,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                )
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: () {
                  if (viewModel.cashIn.isNotEmpty) {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Login()));
                    viewModel.cashIn = [];
                    viewModel.visaIn = [];
                  } else
                    viewModel.displayToastMessage('Cash can not be 0.0');
                },
                child: Container(
                    height: size.height * 0.08,
                    width: size.width,
                    decoration: BoxDecoration(
                      color: Colors.red,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Logout',
                          style: TextStyle(
                              fontSize: size.height * 0.025,
                              color: Colors.white),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.logout,
                          color: Colors.white,
                          size: size.height * 0.03,
                        )
                      ],
                    )),
              ),
            )
          ],
        ));
  }
}
