import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shormeh_pos/data_controller/home_controller.dart';
import 'package:shormeh_pos/ui/widgets/numpad.dart';

import '../../constants.dart';

class SingleItem extends ConsumerWidget {
  const SingleItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(dataFuture);
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                viewModel.removeCartItem(viewModel.chosenItem!);
                viewModel.itemWidget = false;
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: size.height * 0.15,
                  width: size.width * 0.1,
                  decoration: BoxDecoration(
                      color: Colors.red[500],
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Icon(
                      Icons.delete_outline,
                      size: size.height * 0.05,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                viewModel.plusController(viewModel.chosenItem!);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: size.height * 0.15,
                  width: size.width * 0.1,
                  decoration: BoxDecoration(
                      color: Constants.mainColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Icon(
                      Icons.add,
                      size: size.height * 0.05,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                viewModel.minusController(viewModel.chosenItem!);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: size.height * 0.15,
                  width: size.width * 0.1,
                  decoration: BoxDecoration(
                      color: Constants.mainColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Icon(
                      Icons.minimize,
                      size: size.height * 0.05,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          backgroundColor: Constants.scaffoldColor,
                          title: Center(
                            child: Text(
                              'Count',
                              style: TextStyle(
                                  fontSize: size.height * 0.025,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          content: Container(
                              height: size.height*0.4,
                              child: Numpad()),
                        ));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: size.height * 0.15,
                  width: size.width * 0.1,
                  decoration: BoxDecoration(
                      color: Constants.mainColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Icon(
                      Icons.keyboard,
                      size: size.height * 0.05,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                viewModel.switchToCardItemWidget(false);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: size.height * 0.15,
                  width: size.width * 0.1,
                  decoration: BoxDecoration(
                      color: Constants.mainColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.arrow_back,
                        size: size.height * 0.05,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Back',
                        style: TextStyle(
                            fontSize: size.height * 0.019, color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 40,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              viewModel.cardItems[viewModel.chosenItem!].count.toString() +
                  'X     ' +
                  viewModel.cardItems[viewModel.chosenItem!].mainName! +
                  ' ' +
                  viewModel.cardItems[viewModel.chosenItem!].size!,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: size.height * 0.03,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 100,
            ),
            Text(
              viewModel.cardItems[viewModel.chosenItem!].total.toString() +
                  ' SAR',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: size.height * 0.03,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        if (viewModel.cardItems[viewModel.chosenItem!].extra!.isNotEmpty)
          Text(
            'Extra',
            style: TextStyle(
                color: Constants.mainColor,
                fontSize: size.height * 0.025,
                fontWeight: FontWeight.bold),
          ),
        SizedBox(
          height: 5,
        ),
        if (viewModel.cardItems[viewModel.chosenItem!].extra!.isNotEmpty)
          Expanded(
            child: GridView.builder(
              itemCount:
                  viewModel.cardItems[viewModel.chosenItem!].extra!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, childAspectRatio: 5),
              shrinkWrap: true,
              itemBuilder: (context, i) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 40,
                    width: 200,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Constants.mainColor)),
                    child: Center(
                      child: Text(
                        viewModel.cardItems[viewModel.chosenItem!].extra![i],
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: size.height * 0.022,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        SizedBox(
          height: 20,
        ),
        if (viewModel.cardItems[viewModel.chosenItem!].drink != '')
          Text(
            'Drink',
            style: TextStyle(
                color: Constants.mainColor,
                fontSize: size.height * 0.025,
                fontWeight: FontWeight.bold),
          ),
        SizedBox(
          height: 13,
        ),
        if (viewModel.cardItems[viewModel.chosenItem!].drink != '')
          Container(
            height: 32,
            width: 120,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Constants.mainColor)),
            child: Center(
              child: Text(
                viewModel.cardItems[viewModel.chosenItem!].drink!,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: size.height * 0.022,
                    fontWeight: FontWeight.w500),
              ),
            ),
          )
      ],
    );
  }
}
