import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shormeh_pos/constants.dart';
import 'package:shormeh_pos/data_controller/home_controller.dart';
import 'package:shormeh_pos/data_controller/orders_controller.dart';
import 'package:shormeh_pos/models/card_model.dart';
import 'package:shormeh_pos/models/order_model.dart';
import 'package:shormeh_pos/models/payment_model.dart';

class Orders extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(ordersFuture);
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          centerTitle: true,
          automaticallyImplyLeading: false,
          ///////////////////////////////////////taps/////////////////////////////////
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ////////////////////////////////////all tap//////////////////////////
              InkWell(
                  onTap: () {
   viewModel.allTapCantroller();
                  },
                  child: Container(
                    height: 50,
                    width: size.width * 0.15,
                    child: Center(
                      child: Text(
                        'All',
                        style: TextStyle(
                            color: viewModel.index == 0
                                ? Constants.mainColor
                                : Colors.black54),
                      ),
                    ),
                  )),
              Container(
                height: 50,
                width: 2,
                color: Colors.black12,
              ),

              ////////////////////////////////////new orders tap//////////////////////////

              InkWell(
                  onTap: () {
                    viewModel.newOrdersController();
                  },
                  child: Container(
                    height: 50,
                    width: size.width * 0.15,
                    child: Center(
                      child: Text(
                        'New Orders',
                        style: TextStyle(
                            color: viewModel.index == 1
                                ?Constants.mainColor
                                : Colors.black54),
                      ),
                    ),
                  )),
              Container(
                height: 50,
                width: 2,
                color: Colors.black12,
              ),

              // ////////////////////////////////////processing orders tap//////////////////////////
              // InkWell(
              //     onTap: () {
              //
              //     },
              //     child: Padding(
              //       padding: const EdgeInsets.symmetric(horizontal: 20),
              //       child: Container(
              //         height: 50,
              //         width: size.width * 0.15,
              //         child: Center(
              //           child: Text(
              //             'Processing viewModel.Orders',
              //             style: TextStyle(
              //                 color: viewModel.index == 2
              //                     ? Colors.green
              //                     : Colors.black54),
              //           ),
              //         ),
              //       ),
              //     )),
              // Container(
              //   height: 50,
              //   width: 2,
              //   color: Colors.black12,
              // ),
              ////////////////////////////////////finished viewModel.orders tap//////////////////////////
              InkWell(
                  onTap: () {
viewModel.finishedOrdersController();
                  },
                  child: Container(
                    height: 50,
                    width: size.width * 0.15,
                    child: Center(
                      child: Text(
                        'Finished Orders',
                        style: TextStyle(
                            color: viewModel.index == 2
                                ? Constants.mainColor
                                : Colors.black54),
                      ),
                    ),
                  )),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),

          //////////////////////////////////orders/////////////////////////////////
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 60,
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      ListView.builder(
                          itemCount: viewModel.filter.length,
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, i) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                /////////////////////////////////////// viewModel.filter /////////////////////////////////
                                onTap: () {
                                  viewModel.filterOrders(i);
                                },
                                child: Container(
                                  width: size.width * 0.08,
                                  decoration: BoxDecoration(
                                      color: viewModel.filter[i].chosen!
                                          ? Constants.mainColor
                                          : Colors.grey[200],
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: Colors.black12, width: 1.2)),
                                  child: Center(
                                    child: Text(
                                      viewModel.filter[i].title!,
                                      style: TextStyle(
                                        fontSize: size.height * 0.018,
                                        color: viewModel.filter[i].chosen!
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                      SizedBox(width: 30,),
                      InkWell(
                          onTap: (){
viewModel.selectDate(context);
                          },
                          child: Icon(Icons.date_range))
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                GridView.builder(
                  itemCount:viewModel.filteredOrders.length,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 6,
                      childAspectRatio: 2
                    ),
                  itemBuilder: (context, i) {
                    return Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: InkWell(
                            onTap: (){
                              viewModel.chosenOrder = i;
                            },
                        child: Container(

                          decoration: BoxDecoration(

                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Text(
                                'Order #${i + 1}',
                                style: TextStyle(
                                    color: Constants.mainColor,
                                    fontSize: size.height * 0.02),
                              ),
                            ),
                          ),
                          // child: ExpansionTile(
                          //   key: PageStorageKey(i),
                          //   iconColor: Constants.mainColor,
                          //   collapsedIconColor: Constants.mainColor,
                          //   title: InkWell(
                          //     onTap: (){
                          //       viewModel.chosenOrder = i;
                          //     },
                          //     child: Text(
                          //       'Order #${i + 1}',
                          //       style: TextStyle(
                          //           color: Constants.mainColor,
                          //           fontSize: size.height * 0.02),
                          //     ),
                          //   ),
                            // children: !viewModel.filtered
                            //     ? viewModel.chosedOrders[i].products!.map((e) {
                            //         return Padding(
                            //           padding: const EdgeInsets.symmetric(
                            //               horizontal: 15, vertical: 3),
                            //           child: Column(
                            //             children: [
                            //               Row(
                            //                 mainAxisAlignment:
                            //                     MainAxisAlignment.spaceBetween,
                            //                 children: [
                            //                   Text(
                            //                     e.count.toString() +
                            //                         'X ' +
                            //                         e.mainName! +
                            //                         ' ' +
                            //                         e.size!,
                            //                     style: TextStyle(
                            //                         color: Colors.black45,
                            //                         fontWeight: FontWeight.bold,
                            //                         fontSize: size.height * 0.02),
                            //                   ),
                            //                   Padding(
                            //                     padding: const EdgeInsets.only(
                            //                         right: 20),
                            //                     child: Text(
                            //                       e.price.toString() + ' SAR',
                            //                       style: TextStyle(
                            //                           color: Colors.black45,
                            //                           fontWeight: FontWeight.bold,
                            //                           fontSize: size.height * 0.02),
                            //                     ),
                            //                   ),
                            //                 ],
                            //               ),
                            //               Padding(
                            //                 padding: const EdgeInsets.symmetric(
                            //                   horizontal: 10,
                            //                 ),
                            //                 child: Row(
                            //                   children: e.extra!
                            //                       .map((extra) => Text(
                            //                             extra == e.extra!.last
                            //                                 ? extra +
                            //                                     ' + ' +
                            //                                     e.drink!
                            //                                 : extra + ' , ',
                            //                             style: TextStyle(
                            //                                 color: Colors.black45,
                            //                                 fontSize: size.height *
                            //                                     0.018),
                            //                           ))
                            //                       .toList(),
                            //                 ),
                            //               ),
                            //               SizedBox(
                            //                 height: 5,
                            //               ),
                            //               if (viewModel.chosedOrders[i].products!
                            //                       .last.id !=
                            //                   e.id)
                            //                 if (viewModel.chosedOrders[i].products!
                            //                         .last.id !=
                            //                     e.id)
                            //                   Container(
                            //                     height: 1.2,
                            //                     width: size.width,
                            //                     color: Colors.black12,
                            //                   )
                            //             ],
                            //           ),
                            //         );
                            //       }).toList()
                            //     : viewModel.filteredOrders[i].products!.map((e) {
                            //         return Padding(
                            //           padding: const EdgeInsets.symmetric(
                            //               horizontal: 15, vertical: 3),
                            //           child: Column(
                            //             children: [
                            //               Row(
                            //                 mainAxisAlignment:
                            //                     MainAxisAlignment.spaceBetween,
                            //                 children: [
                            //                   Text(
                            //                     e.count.toString() +
                            //                         'X ' +
                            //                         e.mainName! +
                            //                         ' ' +
                            //                         e.size!,
                            //                     style: TextStyle(
                            //                         color: Colors.black45,
                            //                         fontWeight: FontWeight.bold,
                            //                         fontSize: size.height * 0.02),
                            //                   ),
                            //                   Padding(
                            //                     padding: const EdgeInsets.only(
                            //                         right: 20),
                            //                     child: Text(
                            //                       e.price.toString() + ' SAR',
                            //                       style: TextStyle(
                            //                           color: Colors.black45,
                            //                           fontWeight: FontWeight.bold,
                            //                           fontSize: size.height * 0.02),
                            //                     ),
                            //                   ),
                            //                 ],
                            //               ),
                            //               Padding(
                            //                 padding: const EdgeInsets.symmetric(
                            //                   horizontal: 10,
                            //                 ),
                            //                 child: Row(
                            //                   children: e.extra!
                            //                       .map((extra) => Text(
                            //                             extra == e.extra!.last
                            //                                 ? extra +
                            //                                     ' + ' +
                            //                                     e.drink!
                            //                                 : extra + ' , ',
                            //                             style: TextStyle(
                            //                                 color: Colors.black45,
                            //                                 fontSize: size.height *
                            //                                     0.018),
                            //                           ))
                            //                       .toList(),
                            //                 ),
                            //               ),
                            //               SizedBox(
                            //                 height: 5,
                            //               ),
                            //               if (viewModel.filteredOrders[i].products!
                            //                       .last.id !=
                            //                   e.id)
                            //                 Container(
                            //                   height: 1.2,
                            //                   width: size.width,
                            //                   color: Colors.black12,
                            //                 )
                            //             ],
                            //           ),
                            //         );
                            //       }).toList(),

                            // ],
                          ),
                      ),
                      );
                  },
                ),
                SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
