import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shormeh_pos/constants.dart';
import 'package:shormeh_pos/data_controller/products_controller.dart';
import 'package:shormeh_pos/models/card_model.dart';
import '../../data_controller/home_controller.dart';

class Products extends ConsumerWidget {
  int? catID;
  Products({this.catID});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    final homeViewModel = ref.watch(dataFuture);
    final productViewModel = ref.watch(productsFuture);

    return Scaffold(
      body: GridView.builder(
          itemCount: productViewModel.dataAllSubCats.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            childAspectRatio: 1.2,
          ),
          itemBuilder: (context, index) {
            return index == 0
                ? InkWell(
                    onTap: () {
                      homeViewModel.switchToCategories(false);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 3,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Back',
                              style: TextStyle(
                                  fontSize: size.height * 0.04,
                                  color: Constants.mainColor),
                            ),
                            Icon(
                              Icons.arrow_back,
                              size: size.height * 0.04,
                              color: Constants.mainColor,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        homeViewModel.total = double.parse(
                            productViewModel.allSubCats[index].price);
                        homeViewModel.cardItems.forEach((element) {
                          homeViewModel.total =
                              homeViewModel.total + element.total!;
                        });
                        homeViewModel.cardItems.add(CardModel(
                          id: productViewModel.allSubCats[index].id,
                          price: double.parse(
                              productViewModel.allSubCats[index].price),
                          image: productViewModel.allSubCats[index].image,
                          mainName: productViewModel.allSubCats[index].mainName,
                          size: '',
                          extra: [],
                          count: 1,
                          drink: '',
                          total: double.parse(
                              productViewModel.allSubCats[index].price),
                        ));
                      },
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          children: [
                            Flexible(
                              child: Image.network(
                                productViewModel.allSubCats[index].image,
                                fit: BoxFit.cover,
                                width: size.width,
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.all(5),
                                child: Column(
                                  children: [
                                    Text(
                                      productViewModel
                                          .allSubCats[index].mainName,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: size.height * 0.021,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      productViewModel.allSubCats[index].price
                                              .toString() +
                                          ' SAR',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: size.height * 0.018,
                                          fontWeight: FontWeight.bold,
                                          color: Constants.secondryColor),
                                    ),
                                  ],
                                )),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: InkWell(
                                onTap: () {
                                  String chosenSize = '';
                                  String chosenDrink = '';
                                  List<String> chosenExtra = [];
                                  int count = 1;
                                  homeViewModel.cardItems.forEach((element) {
                                    homeViewModel.total =
                                        homeViewModel.total + element.total!;
                                  });
                                  showModalBottomSheet<void>(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return StatefulBuilder(builder:
                                          (BuildContext context,
                                              StateSetter setState) {
                                        return Container(
                                          height: size.height,
                                          child: Column(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  double total = 0.0;
                                                  setState(() {
                                                    homeViewModel.cardItems
                                                        .add(CardModel(
                                                      id: productViewModel
                                                          .allSubCats[index].id,
                                                      price: double.parse(
                                                              productViewModel
                                                                  .allSubCats[
                                                                      index]
                                                                  .price) *
                                                          count,
                                                      image: productViewModel
                                                          .allSubCats[index]
                                                          .image,
                                                      mainName: productViewModel
                                                          .allSubCats[index]
                                                          .mainName,
                                                      size: chosenSize,
                                                      extra: chosenExtra,
                                                      count: count,
                                                      drink: chosenDrink,
                                                      total: total +
                                                          double.parse(
                                                                  productViewModel
                                                                      .allSubCats[
                                                                          index]
                                                                      .price) *
                                                              count,
                                                    ));
                                                  });

                                                  Navigator.pop(context);
                                                },
                                                child: Container(
                                                  height: size.height * 0.07,
                                                  color:
                                                      Constants.secondryColor,
                                                  child: Center(
                                                    child: Text(
                                                      'Done',
                                                      style: TextStyle(
                                                        color:
                                                            Constants.mainColor,
                                                        fontSize:
                                                            size.height * 0.035,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: SingleChildScrollView(
                                                  child: Column(
                                                    children: [
                                                      SizedBox(
                                                        height: 20,
                                                      ),
//////////////////////////////count ///////////////////////////////
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text('Count',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      size.height *
                                                                          0.03,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),

                                                          /////////////////////////////////////count./////////////////////////////
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              InkWell(
                                                                onTap: () {
                                                                  setState(() {
                                                                    if (count >
                                                                        1)
                                                                      count--;
                                                                  });
                                                                },
                                                                child:
                                                                    Container(
                                                                  height: size
                                                                              .height >
                                                                          1000
                                                                      ? size.height *
                                                                          0.05
                                                                      : size.height *
                                                                          0.07,
                                                                  width:
                                                                      size.width *
                                                                          0.08,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Constants
                                                                        .mainColor,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15),
                                                                  ),
                                                                  child:
                                                                      const Padding(
                                                                    padding: EdgeInsets.only(
                                                                        bottom:
                                                                            20),
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .minimize,
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                width: 30,
                                                              ),
                                                              Container(
                                                                height: size
                                                                            .height >
                                                                        1000
                                                                    ? size.height *
                                                                        0.05
                                                                    : size.height *
                                                                        0.07,
                                                                width:
                                                                    size.width *
                                                                        0.08,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  border: Border.all(
                                                                      color: Constants
                                                                          .mainColor,
                                                                      width:
                                                                          1.5),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15),
                                                                ),
                                                                child: Center(
                                                                  child: Text(
                                                                    count
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            size.height *
                                                                                0.025),
                                                                  ),
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                width: 30,
                                                              ),
                                                              InkWell(
                                                                onTap: () {
                                                                  setState(() {
                                                                    count++;
                                                                  });
                                                                },
                                                                child:
                                                                    Container(
                                                                  height: size
                                                                              .height >
                                                                          1000
                                                                      ? size.height *
                                                                          0.05
                                                                      : size.height *
                                                                          0.07,
                                                                  width:
                                                                      size.width *
                                                                          0.08,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Constants
                                                                        .mainColor,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15),
                                                                  ),
                                                                  child: Center(
                                                                    child: Icon(
                                                                      Icons.add,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),

                                                      const SizedBox(
                                                        height: 15,
                                                      ),

                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Column(
                                                            children: [
                                                              Text(
                                                                'Size',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        size.height *
                                                                            0.03,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              const SizedBox(
                                                                height: 10,
                                                              ),
                                                              /////////////////////////////////////size/////////////////////////////
                                                              Container(
                                                                width:
                                                                    size.width *
                                                                        0.3,
                                                                child: ListView
                                                                    .builder(
                                                                        itemCount: productViewModel
                                                                            .sizes
                                                                            .length,
                                                                        shrinkWrap:
                                                                            true,
                                                                        physics:
                                                                            NeverScrollableScrollPhysics(),
                                                                        itemBuilder:
                                                                            (context,
                                                                                i) {
                                                                          return Padding(
                                                                            padding:
                                                                                const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                                                                            child:
                                                                                InkWell(
                                                                              onTap: () {
                                                                                setState(() {
                                                                                  chosenSize = productViewModel.sizes[i];
                                                                                });
                                                                              },
                                                                              child: Container(
                                                                                height: size.height > 1000 ? size.height * 0.04 : size.height * 0.06,
                                                                                decoration: BoxDecoration(
                                                                                  color: chosenSize != productViewModel.sizes[i] ? Colors.grey[200] : Constants.mainColor.withOpacity(0.2),
                                                                                  borderRadius: BorderRadius.circular(15),
                                                                                ),
                                                                                child: Center(
                                                                                  child: Text(
                                                                                    productViewModel.sizes[i],
                                                                                    style: TextStyle(
                                                                                      color: Constants.mainColor,
                                                                                      fontSize: size.width * 0.018,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }),
                                                              ),
                                                            ],
                                                          ),

                                                          /////////////////////////////////////////////////extra//////////////////////////////////////////
                                                          Column(
                                                            children: [
                                                              Text('Extra',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          size.height *
                                                                              0.03,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold)),
                                                              const SizedBox(
                                                                height: 10,
                                                              ),
                                                              Container(
                                                                width:
                                                                    size.width *
                                                                        0.3,
                                                                child: ListView
                                                                    .builder(
                                                                        itemCount: productViewModel
                                                                            .addOn
                                                                            .length,
                                                                        shrinkWrap:
                                                                            true,
                                                                        physics:
                                                                            NeverScrollableScrollPhysics(),
                                                                        itemBuilder:
                                                                            (context,
                                                                                i) {
                                                                          return InkWell(
                                                                            onTap:
                                                                                () {
                                                                              setState(() {
                                                                                chosenExtra.add(productViewModel.addOn[i]);
                                                                              });
                                                                            },
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                                                                              child: Container(
                                                                                height: size.height > 1000 ? size.height * 0.04 : size.height * 0.06,
                                                                                decoration: BoxDecoration(
                                                                                  color: chosenExtra.contains(productViewModel.addOn[i]) ? Constants.mainColor.withOpacity(0.2) : Colors.grey[200],
                                                                                  borderRadius: BorderRadius.circular(15),
                                                                                ),
                                                                                child: Center(
                                                                                  child: Text(
                                                                                    productViewModel.addOn[i],
                                                                                    style: TextStyle(
                                                                                      color: Constants.mainColor,
                                                                                      fontSize: size.width * 0.018,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }),
                                                              ),
                                                            ],
                                                          ),

                                                          //////////////////drink /////////////////////////////////
                                                          Column(
                                                            children: [
                                                              Text('Drinks',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          size.height *
                                                                              0.03,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold)),
                                                              const SizedBox(
                                                                height: 10,
                                                              ),
                                                              ///////////////////////////////////////////////////////////drink/////////////////////////////
                                                              Container(
                                                                width:
                                                                    size.width *
                                                                        0.3,
                                                                child: ListView
                                                                    .builder(
                                                                        itemCount: productViewModel
                                                                            .drinks
                                                                            .length,
                                                                        shrinkWrap:
                                                                            true,
                                                                        physics:
                                                                            NeverScrollableScrollPhysics(),
                                                                        itemBuilder:
                                                                            (context,
                                                                                i) {
                                                                          return InkWell(
                                                                            onTap:
                                                                                () {
                                                                              setState(() {
                                                                                chosenDrink = productViewModel.drinks[i];
                                                                              });
                                                                            },
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                                                                              child: Container(
                                                                                height: size.height > 1000 ? size.height * 0.04 : size.height * 0.06,
                                                                                decoration: BoxDecoration(
                                                                                  color: chosenDrink != productViewModel.drinks[i] ? Colors.grey[200] : Constants.mainColor.withOpacity(0.2),
                                                                                  borderRadius: BorderRadius.circular(15),
                                                                                ),
                                                                                child: Center(
                                                                                  child: Text(
                                                                                    productViewModel.drinks[i],
                                                                                    style: TextStyle(
                                                                                      color: Constants.mainColor,
                                                                                      fontSize: size.width * 0.018,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),

                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      });
                                    },
                                  );
                                },
                                child: Container(
                                  height: 30,
                                  width: size.width,
                                  color: Constants.mainColor,
                                  child: Center(
                                    child: Text(
                                      'Options',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
          }),
    );
  }
}
