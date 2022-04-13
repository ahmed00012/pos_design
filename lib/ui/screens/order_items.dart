import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shormeh_pos/data_controller/home_controller.dart';
import 'package:shormeh_pos/data_controller/orders_controller.dart';
import 'package:shormeh_pos/models/card_model.dart';

import '../../constants.dart';

class OrderItems extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(ordersFuture);
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.fromLTRB(15, 20, 15, 10),
      child: Container(
        height: size.height * 0.8,
        width: size.width * 0.28,
        child: viewModel.chosenOrder != null
            ? Column(
                children: [
                  Text(
                    'Order Number :  ${viewModel.chosenOrder! + 1}',
                    style: TextStyle(
                        fontSize: size.height * 0.028,
                        fontWeight: FontWeight.bold,
                        color: Constants.mainColor,
                        fontStyle: FontStyle.italic),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemCount: viewModel
                          .orders[viewModel.chosenOrder!].products!.length,
                      separatorBuilder: (context, i) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Divider(),
                        );
                      },
                      shrinkWrap: true,
                      itemBuilder: (context, i) {
                        CardModel product = viewModel
                            .orders[viewModel.chosenOrder!].products![i];

                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.black45)),
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      product.count.toString() +
                                          'X  ' +
                                          product.mainName!,
                                      style: TextStyle(
                                          color: Constants.mainColor,
                                          fontSize: size.height * 0.022,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),

                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.black45)),
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      product.total.toString() + ' SAR',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Constants.mainColor,
                                          fontSize: size.height * 0.022,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),

                                // Expanded(

                                //   child: ExpansionTile(

                                //     key: const PageStorageKey(2),

                                //     iconColor: Constants.mainColor,

                                //     collapsedIconColor: Constants.mainColor,

                                //     title:InkWell(

                                //       onTap: (){

                                //         viewModel.switchToCardItemWidget(true, i: i) ;

                                //

                                //       },

                                //       child: Row(

                                //         mainAxisAlignment:

                                //         MainAxisAlignment.spaceBetween,

                                //         children: [

                                //           Flexible(

                                //             child: Text(

                                //               viewModel.cardItems[i].count

                                //                   .toString() +

                                //                   'X ' +

                                //                   viewModel

                                //                       .cardItems[i].mainName!,

                                //               style: TextStyle(

                                //                   color: Colors.black,

                                //                   fontSize: size.height * 0.018,

                                //                   fontWeight: FontWeight.bold),

                                //             ),

                                //           ),

                                //           Flexible(

                                //             child: Text(

                                //               viewModel.cardItems[i].total

                                //                   .toString() +

                                //                   ' SAR',

                                //               overflow: TextOverflow.ellipsis,

                                //               style: TextStyle(

                                //                   color: Colors.black,

                                //                   fontSize: size.height * 0.018,

                                //                   fontWeight: FontWeight.bold),

                                //             ),

                                //           ),

                                //         ],

                                //       ),

                                //     ),

                                //     children: [

                                //       // if (viewModel

                                //       //     .cardItems[i].extra!.isNotEmpty)

                                //       //   Row(

                                //       //     mainAxisAlignment:

                                //       //     MainAxisAlignment.spaceEvenly,

                                //       //     children: [

                                //       //       Flexible(

                                //       //         child: Text(

                                //       //           viewModel.cardItems[i].extra

                                //       //               .toString()

                                //       //               .replaceAll('[', '')

                                //       //               .replaceAll(']', ''),

                                //       //           overflow:

                                //       //           TextOverflow.ellipsis,

                                //       //           style: TextStyle(

                                //       //               color: Colors.black45,

                                //       //               fontSize:

                                //       //               size.height * 0.017,

                                //       //               fontWeight:

                                //       //               FontWeight.w500),

                                //       //         ),

                                //       //       ),

                                //       //     ],

                                //       //   ),

                                //       // if (viewModel.cardItems[i].size != '')

                                //       //   Row(

                                //       //     mainAxisAlignment:

                                //       //     MainAxisAlignment.spaceEvenly,

                                //       //     children: [

                                //       //       Flexible(

                                //       //         child: Text(

                                //       //           'Size : ',

                                //       //           style: TextStyle(

                                //       //               color: Colors.black45,

                                //       //               fontSize:

                                //       //               size.height * 0.017,

                                //       //               fontWeight:

                                //       //               FontWeight.w500),

                                //       //         ),

                                //       //       ),

                                //       //       Flexible(

                                //       //         child: Text(

                                //       //           viewModel.cardItems[i].size!,

                                //       //           overflow:

                                //       //           TextOverflow.ellipsis,

                                //       //           style: TextStyle(

                                //       //               color: Colors.black45,

                                //       //               fontSize:

                                //       //               size.height * 0.017,

                                //       //               fontWeight:

                                //       //               FontWeight.w500),

                                //       //         ),

                                //       //       ),

                                //       //     ],

                                //       //   ),

                                //       // if (viewModel.cardItems[i].drink != '')

                                //       //   Row(

                                //       //     mainAxisAlignment:

                                //       //     MainAxisAlignment.spaceEvenly,

                                //       //     children: [

                                //       //       Flexible(

                                //       //         child: Text(

                                //       //           'Drink : ',

                                //       //           overflow:

                                //       //           TextOverflow.ellipsis,

                                //       //           style: TextStyle(

                                //       //               color: Colors.black45,

                                //       //               fontSize:

                                //       //               size.height * 0.017,

                                //       //               fontWeight:

                                //       //               FontWeight.w500),

                                //       //         ),

                                //       //       ),

                                //       //       Flexible(

                                //       //         child: Text(

                                //       //           viewModel.cardItems[i].drink!,

                                //       //           overflow:

                                //       //           TextOverflow.ellipsis,

                                //       //           style: TextStyle(

                                //       //               color: Colors.black45,

                                //       //               fontSize:

                                //       //               size.height * 0.017,

                                //       //               fontWeight:

                                //       //               FontWeight.w500),

                                //       //         ),

                                //       //       ),

                                //       //     ],

                                //       //   ),

                                //       // SizedBox(

                                //       //   height: 5,

                                //       // ),

                                //     ],

                                //   ),

                                // )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.black45)),
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      'Size :',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: size.height * 0.019,
                                      ),
                                    ),
                                  ),
                                ),

                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.black45)),
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      product.size!,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: size.height * 0.019,
                                      ),
                                    ),
                                  ),
                                ),

                                // Expanded(

                                //   child: ExpansionTile(

                                //     key: const PageStorageKey(2),

                                //     iconColor: Constants.mainColor,

                                //     collapsedIconColor: Constants.mainColor,

                                //     title:InkWell(

                                //       onTap: (){

                                //         viewModel.switchToCardItemWidget(true, i: i) ;

                                //

                                //       },

                                //       child: Row(

                                //         mainAxisAlignment:

                                //         MainAxisAlignment.spaceBetween,

                                //         children: [

                                //           Flexible(

                                //             child: Text(

                                //               viewModel.cardItems[i].count

                                //                   .toString() +

                                //                   'X ' +

                                //                   viewModel

                                //                       .cardItems[i].mainName!,

                                //               style: TextStyle(

                                //                   color: Colors.black,

                                //                   fontSize: size.height * 0.018,

                                //                   fontWeight: FontWeight.bold),

                                //             ),

                                //           ),

                                //           Flexible(

                                //             child: Text(

                                //               viewModel.cardItems[i].total

                                //                   .toString() +

                                //                   ' SAR',

                                //               overflow: TextOverflow.ellipsis,

                                //               style: TextStyle(

                                //                   color: Colors.black,

                                //                   fontSize: size.height * 0.018,

                                //                   fontWeight: FontWeight.bold),

                                //             ),

                                //           ),

                                //         ],

                                //       ),

                                //     ),

                                //     children: [

                                //       // if (viewModel

                                //       //     .cardItems[i].extra!.isNotEmpty)

                                //       //   Row(

                                //       //     mainAxisAlignment:

                                //       //     MainAxisAlignment.spaceEvenly,

                                //       //     children: [

                                //       //       Flexible(

                                //       //         child: Text(

                                //       //           viewModel.cardItems[i].extra

                                //       //               .toString()

                                //       //               .replaceAll('[', '')

                                //       //               .replaceAll(']', ''),

                                //       //           overflow:

                                //       //           TextOverflow.ellipsis,

                                //       //           style: TextStyle(

                                //       //               color: Colors.black45,

                                //       //               fontSize:

                                //       //               size.height * 0.017,

                                //       //               fontWeight:

                                //       //               FontWeight.w500),

                                //       //         ),

                                //       //       ),

                                //       //     ],

                                //       //   ),

                                //       // if (viewModel.cardItems[i].size != '')

                                //       //   Row(

                                //       //     mainAxisAlignment:

                                //       //     MainAxisAlignment.spaceEvenly,

                                //       //     children: [

                                //       //       Flexible(

                                //       //         child: Text(

                                //       //           'Size : ',

                                //       //           style: TextStyle(

                                //       //               color: Colors.black45,

                                //       //               fontSize:

                                //       //               size.height * 0.017,

                                //       //               fontWeight:

                                //       //               FontWeight.w500),

                                //       //         ),

                                //       //       ),

                                //       //       Flexible(

                                //       //         child: Text(

                                //       //           viewModel.cardItems[i].size!,

                                //       //           overflow:

                                //       //           TextOverflow.ellipsis,

                                //       //           style: TextStyle(

                                //       //               color: Colors.black45,

                                //       //               fontSize:

                                //       //               size.height * 0.017,

                                //       //               fontWeight:

                                //       //               FontWeight.w500),

                                //       //         ),

                                //       //       ),

                                //       //     ],

                                //       //   ),

                                //       // if (viewModel.cardItems[i].drink != '')

                                //       //   Row(

                                //       //     mainAxisAlignment:

                                //       //     MainAxisAlignment.spaceEvenly,

                                //       //     children: [

                                //       //       Flexible(

                                //       //         child: Text(

                                //       //           'Drink : ',

                                //       //           overflow:

                                //       //           TextOverflow.ellipsis,

                                //       //           style: TextStyle(

                                //       //               color: Colors.black45,

                                //       //               fontSize:

                                //       //               size.height * 0.017,

                                //       //               fontWeight:

                                //       //               FontWeight.w500),

                                //       //         ),

                                //       //       ),

                                //       //       Flexible(

                                //       //         child: Text(

                                //       //           viewModel.cardItems[i].drink!,

                                //       //           overflow:

                                //       //           TextOverflow.ellipsis,

                                //       //           style: TextStyle(

                                //       //               color: Colors.black45,

                                //       //               fontSize:

                                //       //               size.height * 0.017,

                                //       //               fontWeight:

                                //       //               FontWeight.w500),

                                //       //         ),

                                //       //       ),

                                //       //     ],

                                //       //   ),

                                //       // SizedBox(

                                //       //   height: 5,

                                //       // ),

                                //     ],

                                //   ),

                                // )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.black45)),
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      'Drink :',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: size.height * 0.019,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.black45)),
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      product.drink!,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: size.height * 0.019,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black45)),
                              padding: EdgeInsets.only(left: 10),
                              child: Row(
                                children: [
                                  Text(
                                    'Extra :  ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: size.height * 0.019,
                                    ),
                                  ),

                                  Text(
                                    product.extra
                                        .toString()
                                        .replaceAll('[', '')
                                        .replaceAll(']', ''),
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: size.height * 0.019,
                                    ),
                                  ),

                                  // Expanded(

                                  //   child: ExpansionTile(

                                  //     key: const PageStorageKey(2),

                                  //     iconColor: Constants.mainColor,

                                  //     collapsedIconColor: Constants.mainColor,

                                  //     title:InkWell(

                                  //       onTap: (){

                                  //         viewModel.switchToCardItemWidget(true, i: i) ;

                                  //

                                  //       },

                                  //       child: Row(

                                  //         mainAxisAlignment:

                                  //         MainAxisAlignment.spaceBetween,

                                  //         children: [

                                  //           Flexible(

                                  //             child: Text(

                                  //               viewModel.cardItems[i].count

                                  //                   .toString() +

                                  //                   'X ' +

                                  //                   viewModel

                                  //                       .cardItems[i].mainName!,

                                  //               style: TextStyle(

                                  //                   color: Colors.black,

                                  //                   fontSize: size.height * 0.018,

                                  //                   fontWeight: FontWeight.bold),

                                  //             ),

                                  //           ),

                                  //           Flexible(

                                  //             child: Text(

                                  //               viewModel.cardItems[i].total

                                  //                   .toString() +

                                  //                   ' SAR',

                                  //               overflow: TextOverflow.ellipsis,

                                  //               style: TextStyle(

                                  //                   color: Colors.black,

                                  //                   fontSize: size.height * 0.018,

                                  //                   fontWeight: FontWeight.bold),

                                  //             ),

                                  //           ),

                                  //         ],

                                  //       ),

                                  //     ),

                                  //     children: [

                                  //       // if (viewModel

                                  //       //     .cardItems[i].extra!.isNotEmpty)

                                  //       //   Row(

                                  //       //     mainAxisAlignment:

                                  //       //     MainAxisAlignment.spaceEvenly,

                                  //       //     children: [

                                  //       //       Flexible(

                                  //       //         child: Text(

                                  //       //           viewModel.cardItems[i].extra

                                  //       //               .toString()

                                  //       //               .replaceAll('[', '')

                                  //       //               .replaceAll(']', ''),

                                  //       //           overflow:

                                  //       //           TextOverflow.ellipsis,

                                  //       //           style: TextStyle(

                                  //       //               color: Colors.black45,

                                  //       //               fontSize:

                                  //       //               size.height * 0.017,

                                  //       //               fontWeight:

                                  //       //               FontWeight.w500),

                                  //       //         ),

                                  //       //       ),

                                  //       //     ],

                                  //       //   ),

                                  //       // if (viewModel.cardItems[i].size != '')

                                  //       //   Row(

                                  //       //     mainAxisAlignment:

                                  //       //     MainAxisAlignment.spaceEvenly,

                                  //       //     children: [

                                  //       //       Flexible(

                                  //       //         child: Text(

                                  //       //           'Size : ',

                                  //       //           style: TextStyle(

                                  //       //               color: Colors.black45,

                                  //       //               fontSize:

                                  //       //               size.height * 0.017,

                                  //       //               fontWeight:

                                  //       //               FontWeight.w500),

                                  //       //         ),

                                  //       //       ),

                                  //       //       Flexible(

                                  //       //         child: Text(

                                  //       //           viewModel.cardItems[i].size!,

                                  //       //           overflow:

                                  //       //           TextOverflow.ellipsis,

                                  //       //           style: TextStyle(

                                  //       //               color: Colors.black45,

                                  //       //               fontSize:

                                  //       //               size.height * 0.017,

                                  //       //               fontWeight:

                                  //       //               FontWeight.w500),

                                  //       //         ),

                                  //       //       ),

                                  //       //     ],

                                  //       //   ),

                                  //       // if (viewModel.cardItems[i].drink != '')

                                  //       //   Row(

                                  //       //     mainAxisAlignment:

                                  //       //     MainAxisAlignment.spaceEvenly,

                                  //       //     children: [

                                  //       //       Flexible(

                                  //       //         child: Text(

                                  //       //           'Drink : ',

                                  //       //           overflow:

                                  //       //           TextOverflow.ellipsis,

                                  //       //           style: TextStyle(

                                  //       //               color: Colors.black45,

                                  //       //               fontSize:

                                  //       //               size.height * 0.017,

                                  //       //               fontWeight:

                                  //       //               FontWeight.w500),

                                  //       //         ),

                                  //       //       ),

                                  //       //       Flexible(

                                  //       //         child: Text(

                                  //       //           viewModel.cardItems[i].drink!,

                                  //       //           overflow:

                                  //       //           TextOverflow.ellipsis,

                                  //       //           style: TextStyle(

                                  //       //               color: Colors.black45,

                                  //       //               fontSize:

                                  //       //               size.height * 0.017,

                                  //       //               fontWeight:

                                  //       //               FontWeight.w500),

                                  //       //         ),

                                  //       //       ),

                                  //       //     ],

                                  //       //   ),

                                  //       // SizedBox(

                                  //       //   height: 5,

                                  //       // ),

                                  //     ],

                                  //   ),

                                  // )
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: size.height * 0.1,
                    width: size.width * 0.28,
                    alignment: Alignment.bottomCenter,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Order Method',
                              style: TextStyle(
                                  fontSize: size.height * 0.02,
                                  fontWeight: FontWeight.bold,
                                  color: Constants.mainColor),
                            ),
                            Text(
                              viewModel
                                  .orders[viewModel.chosenOrder!].orderMethod!,
                              style: TextStyle(
                                  fontSize: size.height * 0.02,
                                  fontWeight: FontWeight.bold,
                                  color: Constants.mainColor),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Table',
                              style: TextStyle(
                                  fontSize: size.height * 0.02,
                                  fontWeight: FontWeight.bold,
                                  color: Constants.mainColor),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 7),
                              child: Text(
                                viewModel.orders[viewModel.chosenOrder!].table
                                    .toString(),
                                style: TextStyle(
                                    fontSize: size.height * 0.02,
                                    fontWeight: FontWeight.bold,
                                    color: Constants.mainColor),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Payment',
                              style: TextStyle(
                                  fontSize: size.height * 0.02,
                                  fontWeight: FontWeight.bold,
                                  color: Constants.mainColor),
                            ),
                            Text(
                              viewModel.orders[viewModel.chosenOrder!].payment!,
                              style: TextStyle(
                                  fontSize: size.height * 0.02,
                                  fontWeight: FontWeight.bold,
                                  color: Constants.mainColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              )
            : Container(),
      ),
    );
  }
}
