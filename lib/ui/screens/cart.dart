import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shormeh_pos/data_controller/home_controller.dart';

import '../../constants.dart';

class Cart extends ConsumerWidget {

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final viewModel = ref.watch(dataFuture);
    Size size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.expand,
      children: [
        //////////////////cnacel order button////////////////////////
        if (viewModel.cardItems.isNotEmpty)
          Align(
            alignment: Alignment.topCenter,
            child: InkWell(
              onTap: () {
                viewModel.switchToOrderMethodWidget(false);
                viewModel.switchToPaymentWidget(false);
                viewModel.switchToCategories(false);
                viewModel.switchToCardItemWidget(false);
                viewModel.emptyCardList();
                viewModel.total=0.0;
                viewModel.itemWidget =false;
              },
              child: Container(
                height: size.height * 0.07,
                width: double.infinity,
                color: Colors.red[500],
                child: Center(
                  child: Text(
                    'Cancel Order',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: size.height * 0.025),
                  ),
                ),
              ),
            ),
          ),

/////////////////////card products/////////////////////////////////
        if (viewModel.cardItems.isNotEmpty)
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding:
              EdgeInsets.fromLTRB(15, size.height * 0.07, 15, size.height * 0.14),
              child:  Container(
                height: size.height * 0.8,
                child: ListView.builder(
                  itemCount: viewModel.cardItems.length,
                  shrinkWrap: true,
                  itemBuilder: (context, i) {
                    return InkWell(
                      onTap: (){
                        viewModel.switchToCardItemWidget(true, i: i) ;
                      },
                      child: Slidable(
                        actionPane: const SlidableDrawerActionPane(),
                        secondaryActions: [
                          IconSlideAction(
                            color: Colors.red[400],
                            iconWidget: const Icon(Icons.delete_forever,
                                color: Colors.white),
                            onTap: () {
                              viewModel.removeCartItem(i);
                              viewModel.itemWidget =false;
                              if(viewModel.cardItems.isEmpty)
                                {
                                  viewModel.switchToOrderMethodWidget(false);
                                  viewModel.switchToPaymentWidget(false);
                                  viewModel.switchToCategories(false);
                                  viewModel.switchToCardItemWidget(false);
                                  viewModel.total=0.0;
                                }
                            },
                          ),
                        ],
                        child: Row(
                          children: [
                            Column(

                              children: [
                                IconButton(
                                    onPressed: () {
                                      viewModel. plusController(i);

                                    },
                                    icon: Icon(
                                      Icons.add_box_outlined,
                                      color: Constants.mainColor,
                                    )),

                                IconButton(
                                    onPressed: () {
                                      viewModel. minusController(i);
                                    },
                                    icon: Icon(
                                      Icons.indeterminate_check_box_outlined,
                                      color: Constants.mainColor,
                                    ))
                              ],
                            ),
                            Container(
                              width: size.width*0.21,

                              child:Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if(viewModel.cardItems[i].extra!.isNotEmpty)
                                    SizedBox(height: 10,),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        viewModel.cardItems[i].count
                                            .toString() +
                                            'X ' +
                                            viewModel
                                                .cardItems[i].mainName!,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: size.height * 0.018,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        viewModel.cardItems[i].total
                                            .toString() +
                                            ' SAR',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: size.height * 0.018,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  if(viewModel.cardItems[i].extra!.isNotEmpty)
                                    SizedBox(height: 10,),
                                  if(viewModel.cardItems[i].extra!.isNotEmpty)
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: viewModel.cardItems[i].extra!.map((e) => Text(e,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                        color: Colors.black45
                                      ),)).toList(),
                                    ),
                                  )
                                ],
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
                    );
                  },
                ),
              ),
            ),
          ),

        ////////////////////////////////////summary////////////////////////////////////////
        if (viewModel.cardItems.isNotEmpty)
          Positioned(
            bottom: size.height * 0.07,
            width: size.width * 0.28,
            height: size.height * 0.073,

            child: Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     // Text(
                  //     //   'Order : ',
                  //     //   style: TextStyle(
                  //     //       fontSize: size.height * 0.02,
                  //     //       color: Constants.colorGreen),
                  //     // ),
                  //     // Spacer(),
                  //     Text(
                  //       viewModel.cardItems[0].orderMethod!,
                  //       textAlign: TextAlign.right,
                  //       style: TextStyle(
                  //           fontSize: size.height * 0.02,
                  //           color: Constants.colorGreen),
                  //     ),
                  //   ],
                  // ),
                  // if (viewModel.cardItems[0].table != 0)
                  //   Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //     children: [
                  //       Text(
                  //         'Table : ',
                  //         style: TextStyle(
                  //             fontSize: size.height * 0.02,
                  //             color: Constants.colorGreen),
                  //       ),
                  //       Spacer(),
                  //       Text(
                  //         viewModel.cardItems[0].table.toString(),
                  //         textAlign: TextAlign.right,
                  //         style: TextStyle(
                  //             fontSize: size.height * 0.02,
                  //             color: Constants.colorGreen),
                  //       ),
                  //     ],
                  //   ),
                  Container(
                    width: size.width * 0.2,
                    child: Row(
                      children: [
                        Text(
                          'Total before tax : ',
                          style: TextStyle(
                              fontSize: size.height * 0.023,

                              color: Colors.black45),
                        ),
Spacer(),
                        Text(
                          viewModel.total.toString() +' SAR',
                          style: TextStyle(
                              fontSize: size.height * 0.023,

                              color: Colors.black45),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: size.width * 0.2,
                    child: Row(
                      children: [
                        Text(
                          'Tax : ',
                          style: TextStyle(
                              fontSize: size.height * 0.023,

                              color: Colors.black45),
                        ),
                        Spacer(),
                        Text(
                          (viewModel.total * 0.14)
                              .toStringAsFixed(2) +
                              ' SAR',
                          style: TextStyle(
                              fontSize: size.height * 0.023,

                              color: Colors.black45),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height:5,
                  ),

                ],
              ),
            ),
          ),

////////////////////////////////////////////checkout button////////////////////////////////
        if (viewModel.cardItems.isNotEmpty)
          Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              onTap: () {
                // viewModel.switchToPaymentWidget(true);
                viewModel.tax = viewModel.total * 0.14;
                viewModel.switchToOrderMethodWidget(true);
              },
              child: Container(
                height: size.height * 0.07,
                width: size.width ,
                color: Constants.mainColor,
                alignment: Alignment.center,
                child: Container(
                  width: size.width*0.2 ,
                  child: Row(

                      children: [
                        Text(
                          'Total :',
                          style: TextStyle(
                              fontSize: size.height * 0.025,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                        Spacer(),

                        Text(
                          (viewModel.total + viewModel.total * 0.14)
                              .toStringAsFixed(2) +
                              ' SAR',
                          style: TextStyle(
                              fontSize: size.height * 0.025,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                ),

              ),
            ),
          )
      ],
    );
  }
}
