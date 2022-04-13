
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:shormeh_pos/constants.dart';
import 'package:shormeh_pos/ui/screens/payment_screen.dart';
import 'package:shormeh_pos/ui/screens/products.dart';
import 'package:shormeh_pos/ui/screens/receipt.dart';
import 'package:shormeh_pos/ui/screens/single_item.dart';
import 'package:shormeh_pos/ui/widgets/bottom_nav_bar.dart';
import 'package:shormeh_pos/ui/widgets/category_widget.dart';
import 'package:shormeh_pos/ui/widgets/more_widget.dart';
import 'package:split_view/split_view.dart';
import '../../data_controller/home_controller.dart';
import 'cart.dart';
import 'new_home.dart';
import 'order_items.dart';
import 'order_method.dart';

enum SelectedTab { orders, home, tables }

class Home extends ConsumerWidget {
  // var _selectedTab = SelectedTab.home;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(dataFuture);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      extendBody: false,
      body: WillPopScope(
        onWillPop: () {
          viewModel.switchToOrderMethodWidget(false);
          viewModel.switchToPaymentWidget(false);
          viewModel.switchToCategories(false);
          viewModel.switchToCardItemWidget(false);
          return Future.value(false);
        },
        child: Row(

          children: [
            /////////////////////////////////////////card items//////////////////////////////////////

            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 4, 20),
              child: Container(
                  width: size.width * 0.28,
                  child: Card(
                      elevation: 5,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: viewModel.selectedTab == SelectedTab.orders
                          ? OrderItems()
                          : Cart())),
            ),


            /////////////////////////////////////////////// Payment screen///////////////////////////////////////

            viewModel.paymentWidget
                ? Expanded(child: Payment())
                : viewModel.itemWidget
                    /////////////////////////////////single item screen///////////////////
                    ? Expanded(child: SingleItem())
                    : viewModel.orderMethod
                        ? Expanded(child: OrderMethod())
                        :

                        ///////////////categories screen////////////////////////////////////////
                        Expanded(
                            child: Container(
                              child: Column(
                                children: [
                                  ////////////////////////////////////////////upper cards/////////////////////////////////////////
                                  Container(
                                    height: size.height * 0.15,
                                    width: double.infinity,
                                    color: Constants.scaffoldColor,
                                    alignment: Alignment.center,
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 20,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              if (viewModel
                                                  .cardItems.isNotEmpty)
                                                viewModel.switchToPaymentWidget(
                                                    true);
                                              else
                                                viewModel.displayToastMessage(
                                                    'Order list is empty');
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                height: size.height * 0.15,
                                                width: size.width * 0.1,
                                                decoration: BoxDecoration(
                                                    color: Constants.mainColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Image.asset(
                                                      'assets/images/printer.png',
                                                      height:
                                                          size.height * 0.05,
                                                      color: Colors.white,
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      'Print',
                                                      style: TextStyle(
                                                          fontSize:
                                                              size.height *
                                                                  0.019,
                                                          color: Colors.white),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              if (viewModel
                                                  .cardItems.isNotEmpty) {
                                                viewModel.customerPhone.text =
                                                    '';
                                                viewModel.customerName.text =
                                                    '';
                                                showDialog(
                                                    context: context,
                                                    builder: (_) => AlertDialog(
                                                          backgroundColor:
                                                              Constants
                                                                  .scaffoldColor,
                                                          title: Center(
                                                            child: Text(
                                                              'Add Customer',
                                                              style: TextStyle(
                                                                  fontSize: size
                                                                          .height *
                                                                      0.025),
                                                            ),
                                                          ),
                                                          content: Container(
                                                            width: size.width *
                                                                0.4,
                                                            height:
                                                                size.height *
                                                                    0.3,
                                                            child: Column(
                                                              children: [
                                                                ///////////////customer name//////////////////////////////////////////
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .symmetric(
                                                                      horizontal:
                                                                          5,
                                                                      vertical:
                                                                          10),
                                                                  child:
                                                                      Container(
                                                                    height: size
                                                                            .height *
                                                                        0.07,
                                                                    decoration: BoxDecoration(
                                                                        color: Colors
                                                                            .white,
                                                                        border: Border.all(
                                                                            color: Colors
                                                                                .black12,
                                                                            width:
                                                                                1.2),
                                                                        borderRadius:
                                                                            BorderRadius.circular(10)),
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsets
                                                                              .symmetric(
                                                                          horizontal:
                                                                              10),
                                                                      child:
                                                                          TextField(
                                                                        controller:
                                                                            viewModel.customerName,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          contentPadding:
                                                                              EdgeInsets.all(10),
                                                                          label:
                                                                              Text(
                                                                            'Customer Name',
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: size.height * 0.02,
                                                                              color: Colors.black45,
                                                                            ),
                                                                          ),
                                                                          border:
                                                                              InputBorder.none,
                                                                          icon:
                                                                              Icon(
                                                                            Icons.person,
                                                                            color:
                                                                                Colors.black45,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),

                                                                ///////////////customer phone//////////////////////////////////////////
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .symmetric(
                                                                      horizontal:
                                                                          5,
                                                                      vertical:
                                                                          10),
                                                                  child:
                                                                      Container(
                                                                    height: size
                                                                            .height *
                                                                        0.07,
                                                                    decoration: BoxDecoration(
                                                                        color: Colors
                                                                            .white,
                                                                        border: Border.all(
                                                                            color: Colors
                                                                                .black12,
                                                                            width:
                                                                                1.2),
                                                                        borderRadius:
                                                                            BorderRadius.circular(10)),
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsets
                                                                              .symmetric(
                                                                          horizontal:
                                                                              10),
                                                                      child:
                                                                          TextField(
                                                                        controller:
                                                                            viewModel.customerPhone,
                                                                        keyboardType:
                                                                            TextInputType.phone,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          contentPadding:
                                                                              EdgeInsets.all(10),
                                                                          label:
                                                                              Text(
                                                                            'Customer Phone',
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: size.height * 0.02,
                                                                              color: Colors.black45,
                                                                            ),
                                                                          ),
                                                                          border:
                                                                              InputBorder.none,
                                                                          icon:
                                                                              Icon(
                                                                            Icons.phone,
                                                                            color:
                                                                                Colors.black45,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),

                                                                SizedBox(
                                                                  height: 30,
                                                                ),
                                                                //////////////////done button////////////////////////
                                                                InkWell(
                                                                  onTap: () {
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    height: size
                                                                            .height *
                                                                        0.07,
                                                                    width:
                                                                        size.width *
                                                                            0.2,
                                                                    decoration: BoxDecoration(
                                                                        color: Constants
                                                                            .mainColor,
                                                                        borderRadius:
                                                                            BorderRadius.circular(10)),
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Text(
                                                                        'Save',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white,
                                                                            fontSize: size.height * 0.025),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ));
                                              } else
                                                viewModel.displayToastMessage(
                                                    'Order list is empty');
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                height: size.height * 0.15,
                                                width: size.width * 0.1,
                                                decoration: BoxDecoration(
                                                    color: Constants.mainColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.person,
                                                      size: size.height * 0.07,
                                                      color: Colors.white,
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      'Customer',
                                                      style: TextStyle(
                                                          fontSize:
                                                              size.height *
                                                                  0.019,
                                                          color: Colors.white),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: (){
                                              viewModel.newHome=!viewModel.newHome;
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                                height: size.height * 0.15,
                                                width: size.width * 0.1,
                                                decoration: BoxDecoration(
                                                    color: Constants.mainColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.home,
                                                      size: size.height * 0.07,
                                                      color: Colors.white,
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      'Home',
                                                      style: TextStyle(
                                                          fontSize:
                                                              size.height * 0.019,
                                                          color: Colors.white),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              if (viewModel
                                                  .cardItems.isNotEmpty) {
                                                viewModel.notes.text = '';
                                                showDialog(
                                                    context: context,
                                                    builder: (_) => AlertDialog(
                                                          backgroundColor:
                                                              Constants
                                                                  .scaffoldColor,
                                                          title: Center(
                                                            child: Text(
                                                              'Add Notes',
                                                              style: TextStyle(
                                                                  fontSize: size
                                                                          .height *
                                                                      0.025),
                                                            ),
                                                          ),
                                                          content: Container(
                                                            width: size.width *
                                                                0.4,
                                                            height:
                                                                size.height *
                                                                    0.3,
                                                            child: Column(
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .symmetric(
                                                                      horizontal:
                                                                          5,
                                                                      vertical:
                                                                          10),
                                                                  child:
                                                                      Container(
                                                                    height: size
                                                                            .height *
                                                                        0.15,
                                                                    decoration: BoxDecoration(
                                                                        color: Colors
                                                                            .white,
                                                                        border: Border.all(
                                                                            color: Colors
                                                                                .black12,
                                                                            width:
                                                                                1.2),
                                                                        borderRadius:
                                                                            BorderRadius.circular(10)),
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsets
                                                                              .symmetric(
                                                                          horizontal:
                                                                              10),
                                                                      child:
                                                                          TextField(
                                                                        controller:
                                                                            viewModel.notes,
                                                                        maxLines:
                                                                            4,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          contentPadding:
                                                                              EdgeInsets.all(10),
                                                                          label:
                                                                              Text(
                                                                            'Notes',
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: size.height * 0.02,
                                                                              color: Colors.black45,
                                                                            ),
                                                                          ),
                                                                          border:
                                                                              InputBorder.none,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 30,
                                                                ),
                                                                //////////////////done button////////////////////////
                                                                InkWell(
                                                                  onTap: () {
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    height: size
                                                                            .height *
                                                                        0.07,
                                                                    width:
                                                                        size.width *
                                                                            0.2,
                                                                    decoration: BoxDecoration(
                                                                        color: Constants
                                                                            .mainColor,
                                                                        borderRadius:
                                                                            BorderRadius.circular(10)),
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Text(
                                                                        'Save',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white,
                                                                            fontSize: size.height * 0.025),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ));
                                              } else
                                                viewModel.displayToastMessage(
                                                    'Order list is empty');
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                height: size.height * 0.15,
                                                width: size.width * 0.1,
                                                decoration: BoxDecoration(
                                                    color: Constants.mainColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.note_outlined,
                                                      size: size.height * 0.05,
                                                      color: Colors.white,
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      'Notes',
                                                      style: TextStyle(
                                                          fontSize:
                                                              size.height *
                                                                  0.019,
                                                          color: Colors.white),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),

                                          InkWell(
                                            onTap: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (_) => AlertDialog(
                                                        backgroundColor:
                                                            Constants
                                                                .scaffoldColor,
                                                        title: Center(
                                                          child: Text(
                                                            'Settings',
                                                            style: TextStyle(
                                                                fontSize:
                                                                    size.height *
                                                                        0.025),
                                                          ),
                                                        ),
                                                        content: More(),
                                                      ));
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                height: size.height * 0.15,
                                                width: size.width * 0.1,
                                                decoration: BoxDecoration(
                                                    color: Constants.mainColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.arrow_circle_down,
                                                      size: size.height * 0.05,
                                                      color: Colors.white,
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      'More',
                                                      style: TextStyle(
                                                          fontSize:
                                                              size.height *
                                                                  0.019,
                                                          color: Colors.white),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),
                                  ),


                                  ////////////////////////////////////////////////////////search field/////////////////////
                                  Container(
                                    color: Constants.scaffoldColor,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      child: Card(
                                        elevation: 2,
                                        child: Container(
                                          height: size.height * 0.06,
                                          width: size.width,
                                          color: Colors.white,
                                          // decoration: BoxDecoration(
                                          //     color: Colors.white,
                                          //     border: Border.all(
                                          //         color: Constants.colorOrange,
                                          //         width: 1.2),
                                          //     borderRadius:
                                          //         BorderRadius.circular(10)),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: TextField(
                                              controller: viewModel.search,
                                              decoration: InputDecoration(
                                                label: Text(
                                                  viewModel.selectedTab ==
                                                          SelectedTab.orders
                                                      ? 'Search Orders'
                                                      : 'Search Product',
                                                  style: TextStyle(
                                                    fontSize:
                                                        size.height * 0.02,
                                                    color: Constants.mainColor,
                                                  ),
                                                ),
                                                border: InputBorder.none,
                                                suffixIcon: Icon(
                                                  Icons.search,
                                                  color: Constants.mainColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  viewModel.products
                                      ? Expanded(
                                          child: GestureDetector(
                                            onHorizontalDragEnd:
                                                (DragEndDetails details) =>
                                                    viewModel.onHorizontalDrag(
                                                        details),
                                            child: Products(
                                              // catID: state.categories[index].id,
                                              catID: viewModel
                                                  .categories[viewModel.index]
                                                  .id,
                                            ),
                                          ),
                                        )
                                      : Expanded(
                                          child: Stack(
                                              children: [
                                                viewModel.selectedTab ==
                                                        SelectedTab.home
                                                    ? viewModel.newHome?
                                                    NewHome():
                                                ListView(
                                                        children: [
                                                          GridView.builder(
                                                            itemCount: viewModel
                                                                .categories
                                                                .length,
                                                            physics:
                                                                NeverScrollableScrollPhysics(),
                                                            shrinkWrap: true,
                                                            gridDelegate:
                                                                SliverGridDelegateWithFixedCrossAxisCount(
                                                              crossAxisCount: 5,
                                                              childAspectRatio:
                                                                  1.3,
                                                            ),
                                                            itemBuilder:
                                                                (context, i) {
                                                              return InkWell(
                                                                onTap: () {
                                                                  viewModel
                                                                      .switchToCategories(
                                                                          true);
                                                                  viewModel
                                                                      .setIndex(
                                                                          i);
                                                                },
                                                                child:
                                                                    CategoryWidget(
                                                                  name: viewModel
                                                                      .categories[
                                                                          i]
                                                                      .name,
                                                                  image: viewModel
                                                                      .categories[
                                                                          i]
                                                                      .image,
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                          SizedBox(
                                                            height:
                                                                size.height *
                                                                    0.15,
                                                          )
                                                        ],
                                                      )
                                                    : viewModel.current,

                                                ///////////////////////////////// bottom nav bar//////////////////////
                                                BottomNavBar()
                                              ],
                                            ),

                                        ),
                                ],
                              ),
                            ),
                          ),
          ],
        ),
      ),
    );
  }
}
