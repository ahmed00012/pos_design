import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shormeh_pos/data_controller/home_controller.dart';

class Numpad extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(dataFuture);
    Size size = MediaQuery.of(context).size;
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Container(
              height: 50,
              width: 220,
              color: Colors.white,
              child: Center(
                child: Text(
                    viewModel.countText.join(),
                    style: TextStyle(fontSize: size.height * 0.022)),
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [1, 2, 3]
              .map((e) => InkWell(
                    onTap: () {
                      viewModel.countText.add(e.toString());
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        height: 50,
                        width: 70,
                        color: Colors.white,
                        child: Center(
                          child: Text(
                            e.toString(),
                            style: TextStyle(fontSize: size.height * 0.022),
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
                      viewModel.countText.add(e.toString());
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        height: 50,
                        width: 70,
                        color: Colors.white,
                        child: Center(
                          child: Text(
                            e.toString(),
                            style: TextStyle(fontSize: size.height * 0.022),
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
                      viewModel.countText.add(e.toString());
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        height: 50,
                        width: 70,
                        color: Colors.white,
                        child: Center(
                          child: Text(
                            e.toString(),
                            style: TextStyle(fontSize: size.height * 0.022),
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
                if (viewModel.countText.isNotEmpty)
                  viewModel.countText.remove(viewModel.countText.last);
              },
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  height: 50,
                  width: 70,
                  color: Colors.red[500],
                  child: Center(
                    child: Icon(
                      Icons.backspace_outlined,
                      size: size.height * 0.025,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                if (viewModel.countText.isNotEmpty)
                  viewModel.countText.add('0');
              },
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  height: 50,
                  width: 70,
                  color: Colors.white,
                  child: Center(
                    child: Text(
                      '0',
                      style: TextStyle(fontSize: size.height * 0.022),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: InkWell(
                onTap: () {
                  viewModel.cardItems[viewModel.chosenItem!].count =
                      int.parse(viewModel.countText.join());
                  viewModel.textCountController(viewModel.chosenItem!);
                  viewModel.countText = [];
                  Navigator.pop(context);
                },
                child: Container(
                  height: 50,
                  width: 70,
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
        )
      ],
    ));
  }
}
