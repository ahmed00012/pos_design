import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shormeh_pos/data_controller/home_controller.dart';
import 'package:shormeh_pos/ui/screens/receipt.dart';

import '../../constants.dart';

class Payment extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(dataFuture);
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 70),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SingleChildScrollView(
                child: Container(
                  width: size.width * 0.35,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //////////////payment////////////////////////////////////////
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                'Payment : ',
                                style: TextStyle(
                                    fontSize: size.height * 0.022,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            if (viewModel.chosenPayment == 'Cash')
                              Container(
                                height: size.height * 0.06,
                                width: 150,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Colors.black12, width: 1.2),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: TextField(
                                    controller: viewModel.amount,
                                    keyboardType:
                                        TextInputType.numberWithOptions(),
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(10),
                                      label: Text(
                                        'Amount',
                                        style: TextStyle(
                                          fontSize: size.height * 0.02,
                                          color: Colors.black45,
                                        ),
                                      ),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      Container(
                        width: size.width * 0.35,
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: viewModel.paymentType.length,
                            itemBuilder: (context, i) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: InkWell(
                                  onTap: () {
                                    viewModel.selectPayment(i);
                                  },
                                  child: Container(
                                    width: size.width * 0.35,
                                    height: size.height * 0.06,
                                    decoration: BoxDecoration(
                                        color: viewModel.paymentType[i].chosen!
                                            ? Constants.mainColor
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        border:
                                            Border.all(color: Colors.black12)),
                                    child: Center(
                                      child: Text(
                                        viewModel.paymentType[i].title!,
                                        style: TextStyle(
                                            fontSize: size.height * 0.02,
                                            color:
                                                viewModel.paymentType[i].chosen!
                                                    ? Colors.white
                                                    : Colors.black,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),

                      SizedBox(
                        height: 30,
                      ),

                      ////////////////////////////coupoun/////////////////////////////////////////////////////

                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Container(
                          width: size.width * 0.35,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 7,
                                child: Container(
                                  height: size.height * 0.06,
                                  // width: size.width*0.4,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: Colors.black12, width: 1.2),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: TextField(
                                      controller: viewModel.coupon,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(10),
                                        label: Text(
                                          'Copoun',
                                          style: TextStyle(
                                            fontSize: size.height * 0.02,
                                            color: Colors.black45,
                                          ),
                                        ),
                                        border: InputBorder.none,
                                        icon: Image.asset(
                                          'assets/images/discount.png',
                                          color: Colors.black45,
                                          height: 30,
                                          width: 30,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                    },
                                    child: Container(
                                      height: size.height * 0.06,
                                      // width: size.width*0.2,
                                      decoration: BoxDecoration(
                                          color: Constants.mainColor,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                        child: Text(
                                          'Add',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: size.height * 0.02),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),

                      SizedBox(
                        height: size.height * 0.06,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: size.width * 0.3,
                  child: Receipt(),
                ),
              ),
            ],
          ),
        ),

        ////////////////////////////// x button ///////////////////////////////
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.topRight,
            child: InkWell(
              onTap: () {
                viewModel.switchToPaymentWidget(false);
              },
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    color: Colors.red[400],
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Icon(
                    Icons.clear,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        ///////////////////////////////////////////////////////////////////done button//////////////////////
        Align(
          alignment: Alignment.bottomCenter,
          child: InkWell(
            onTap: () {
              // viewModel.donePayment();

              if (viewModel.amount.text.isNotEmpty) {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: Text(
                              'Remaining : ${double.parse(viewModel.amount.text) - viewModel.total} SAR'),
                          content: Container(
                            height: 70,
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  viewModel.total = 0.0;
                                  viewModel.amount.text = '';
                                  viewModel.cardItems = [];
                                  viewModel.switchToPaymentWidget(false);
                                  viewModel.switchToCategories(false);
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  height: 50,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      color: Constants.mainColor,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Center(
                                    child: Text(
                                      'Ok',
                                      style: TextStyle(
                                          fontSize: size.height * 0.025,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ));
              } else {
                viewModel.total = 0.0;
                viewModel.amount.text = '';
                viewModel.cardItems = [];
                viewModel.switchToPaymentWidget(false);
                viewModel.switchToCategories(false);
              }
            },
            child: Container(
              height: size.height * 0.06,
              color: Constants.secondryColor,
              child: Center(
                child: Text(
                  'Pay',
                  style: TextStyle(
                    fontSize: size.height * 0.035,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
