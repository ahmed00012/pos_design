import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shormeh_pos/data_controller/home_controller.dart';

import '../../constants.dart';

class OrderMethod extends ConsumerWidget {

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final viewModel = ref.watch(dataFuture);
    Size size = MediaQuery.of(context).size;
    return   Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () {
                    viewModel.switchToOrderMethodWidget(false);
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
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  'Order',
                  style: TextStyle(
                      fontSize: size.height * 0.03,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /////////////////////////take away/////////////////////////////////
                  InkWell(
                    onTap: () {
                      viewModel.setOrderMethod('Take Away');
                    },
                    child: Container(
                      height: size.height * 0.2,
                      width: size.width * 0.2,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                              color: viewModel.chosenOrderMethod ==
                                  'Take Away'
                                  ? Constants.mainColor
                                  : Colors.black12,
                              width: viewModel.chosenOrderMethod ==
                                  'Take Away'
                                  ? 2
                                  : 1)),
                      child: Center(
                        child: Text(
                          'Take Away',
                          style: TextStyle(
                              fontSize: size.height * 0.025,
                              fontWeight: FontWeight.w500,
                              color: viewModel.chosenOrderMethod ==
                                  'Take Away'
                                  ? Constants.mainColor
                                  : Colors.black45),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.05,
                  ),
                  ///////////////////////////////////////////////dine in .///////////////////////////////////
                  InkWell(
                    onTap: () {
                      viewModel.setOrderMethod('Dine In');
                    },
                    child: Container(
                      height: size.height * 0.2,
                      width: size.width * 0.2,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                              color: viewModel.chosenOrderMethod ==
                                  'Dine In'
                                  ? Constants.mainColor
                                  : Colors.black12,
                              width: viewModel.chosenOrderMethod ==
                                  'Dine In'
                                  ? 2
                                  : 1)),
                      child: Center(
                        child: Text(
                          'Dine In',
                          style: TextStyle(
                              fontSize: size.height * 0.025,
                              fontWeight: FontWeight.w500,
                              color: viewModel.chosenOrderMethod ==
                                  'Dine In'
                                  ? Constants.mainColor
                                  : Colors.black45),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 100,
              ),
              /////////////////////////////////////////tables////////////////////////////////

              if (viewModel.tablesWidget)
                GridView.builder(
                  itemCount: 12,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 6,
                    childAspectRatio: 1.7,
                  ),
                  itemBuilder: (context, i) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: InkWell(
                        onTap: () {
                          viewModel.reserveTable(i);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: viewModel.tables[i].busy!
                                  ?  Constants.colorRed
                                  : Colors.white,
                              borderRadius:
                              BorderRadius.circular(10.0),
                              border: Border.all(
                                  color: viewModel.tables[i].busy!
                                      ? Colors
                                      .red
                                      : Constants.mainColor,
                                  width: 1)),
                          child: Center(
                            child: Text(
                              'Table ${viewModel.tables[i].num}',
                              style: TextStyle(
                                color: viewModel.tables[i].busy!
                                    ? Colors.white:Constants.mainColor,
                                  fontSize: size.height * 0.03),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),

              /////////////////////////////////////////////////done button////////////////////////

              SizedBox(
                height: size.height * 0.06,
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child:viewModel.tablesWidget? Row(
            children: [
              Expanded(
                 child: InkWell(
                  onTap: () {
                    viewModel.switchToPaymentWidget(true);
                    viewModel.switchToOrderMethodWidget(false);
                  },
                  child: Container(
                    height: size.height * 0.06,
                    color: Constants.secondryColor,
                    child: Center(
                      child: Text(
                        'Pay Now',
                        style: TextStyle(
                          fontSize: size.height * 0.03,
                        ),
                      ),
                    ),
                  ),
              ),
               ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    viewModel.switchToOrderMethodWidget(false);
                    viewModel.switchToCategories(false);
                    viewModel.cardItems = [];
                    viewModel.total = 0.0;
                  },
                  child: Container(
                    height: size.height * 0.06,
                    
                    color: Colors.red[500],
                    child: Center(
                      child: Text(
                        'Pay Later',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: size.height * 0.03,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ): InkWell(
            onTap: () {
              viewModel.switchToPaymentWidget(true);
              viewModel.switchToOrderMethodWidget(false);
            },
            child: Container(
              height: size.height * 0.06,
              color: Constants.secondryColor,
              child: Center(
                child: Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: size.height * 0.03,
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
