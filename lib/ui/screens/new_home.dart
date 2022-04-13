import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shormeh_pos/constants.dart';
import 'package:shormeh_pos/data_controller/home_controller.dart';
import 'package:shormeh_pos/data_controller/products_controller.dart';
import 'package:shormeh_pos/models/card_model.dart';

class NewHome extends ConsumerWidget {
  // var _selectedTab = SelectedTab.home;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(dataFuture);
    final viewModelProducts = ref.watch(productsFuture);
    Size size = MediaQuery.of(context).size;
    return Column(

      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 200,
                  child: ListView.builder(
                      itemCount: viewModel.categories.length,
                      shrinkWrap: true,
                      itemBuilder: (context, i) {
                        return i==0? InkWell(
                          onTap: (){
                            viewModel.options =true;
                            viewModel.chooseCategory(0);
                          },
                          child: Container(
                            height: 50,
                            color: Constants.mainColor,
                            child: Center(
                              child: Text(
                                'Options',
                                style: TextStyle(
                                  fontSize: size.height*0.02,
                                  color: Colors.white
                                ),
                              ),
                            ),
                          ),
                        ): InkWell(
                          onTap: () {
                            viewModel.chooseCategory(i);
                            viewModel.options = false;
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 7),
                            child: Container(
                              height: 50,
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border(
                                      left: BorderSide(
                                          color: viewModel.categories[i].chosen
                                              ? Colors.amber
                                              : Constants.mainColor,
                                          width: 7))),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Text(
                                  viewModel.categories[i].name,
                                  style: TextStyle(
                                      fontSize: size.height * 0.02,
                                      color: Constants.mainColor,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                Expanded(
                    child: GridView.builder(
                        itemCount: viewModel.options?viewModelProducts.options.length:
                        viewModelProducts.allSubCats.length,
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5,
                          childAspectRatio: 1.3,
                        ),
                        itemBuilder: (context, i) {
                          return InkWell(
                            onTap: () {
                              if(!viewModel.options) {
                                viewModel.total = double.parse(
                                    viewModelProducts.allSubCats[i].price);
                                viewModel.cardItems.forEach((element) {
                                  viewModel.total =
                                      viewModel.total + element.total!;
                                });
                                viewModel.cardItems.add(CardModel(
                                  id: viewModelProducts.allSubCats[i].id,
                                  price: double.parse(
                                      viewModelProducts.allSubCats[i].price),
                                  image: viewModelProducts.allSubCats[i].image,
                                  mainName:
                                      viewModelProducts.allSubCats[i].mainName,
                                  size: '',
                                  extra: [],
                                  count: 1,
                                  drink: '',
                                  total: double.parse(
                                      viewModelProducts.allSubCats[i].price),
                                ));
                              }
                              else{
viewModel.cardItems.last.extra!.add(viewModelProducts.options[i]);
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  height: 20,
                                  width: 20,
                                  color: Colors.white,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [

                                      Text(
                                        viewModel.options? viewModelProducts.options[i]:
                                        viewModelProducts.allSubCats[i].mainName,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: size.height * 0.02),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      if(!viewModel.options)
                                      Text(
                                        viewModelProducts.allSubCats[i].price +
                                            ' SAR',
                                        style: TextStyle(
                                            fontSize: size.height * 0.02,
                                            color: Constants.secondryColor,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  )),
                            ),
                          );
                        }))
              ],
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.105,
        )
      ],
    );
  }
}
