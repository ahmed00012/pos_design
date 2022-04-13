import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shormeh_pos/data_controller/finance_controller.dart';
import 'package:shormeh_pos/data_controller/home_controller.dart';
import 'package:shormeh_pos/ui/screens/home.dart';

class Finance extends  ConsumerWidget {


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final viewModel = ref.watch(financeFuture);
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text('Cash In',style: TextStyle(
              fontSize: size.height*0.03,
              fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 30,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 80,
                    width: 370,

                    decoration: BoxDecoration(
                        color: Colors.white,

                    ),

                    child: Center(
                      child: Text(viewModel.cashInInit.join(),
                        style: TextStyle(fontSize: size.height * 0.025),),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [1, 2, 3]
                      .map((e) => InkWell(
                    onTap: () {
                    viewModel.addNumInit(e.toString());
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        height: 80,
                        width: 120,
                        color: Colors.white,
                        child: Center(
                          child: Text(
                            e.toString(),
                            style: TextStyle(fontSize: size.height * 0.025),
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
                      viewModel.addNumInit(e.toString());
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        height: 80,
                        width: 120,
                        color: Colors.white,
                        child: Center(
                          child: Text(
                            e.toString(),
                            style: TextStyle(fontSize: size.height * 0.025),
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
                      viewModel.addNumInit(e.toString());
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        height: 80,
                        width: 120,
                        color: Colors.white,
                        child: Center(
                          child: Text(
                            e.toString(),
                            style: TextStyle(fontSize: size.height * 0.025),
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
                      onTap: (){
                        viewModel.removeNumberInit();

                      },
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          height: 80,
                          width: 120,
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
viewModel.addNumInit(0.toString());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          height: 80,
                          width: 120,
                          color: Colors.white,
                          child: Center(
                            child: Text(
                              '0',
                              style: TextStyle(fontSize: size.height * 0.025),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: InkWell(
                        onTap: (){
// viewModel.doneButtonCashIn(context);
viewModel.cashInInit=[];
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                        },
                        child: Container(
                          height: 80,
                          width: 120,
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
            )
          ],
        ),
      ),
    );
  }
}