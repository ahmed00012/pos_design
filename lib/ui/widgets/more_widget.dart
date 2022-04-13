import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shormeh_pos/data_controller/more_controller.dart';
import 'package:shormeh_pos/ui/screens/finance.dart';
import 'package:shormeh_pos/ui/screens/finince_out.dart';
import 'package:shormeh_pos/ui/screens/login.dart';


import '../../constants.dart';
import 'custom_expansion_tile.dart';

class More extends  ConsumerWidget  {
  const More({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(moreFuture);
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.4,
      height: size.height * 0.25 ,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                onTap: (){
                 viewModel.changeLanguage();
                },
                child: Container(
                  height: size.height * 0.05,
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        'Language',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: size.height * 0.025),
                      )),
                      viewModel.lan=='ar'?
                      Image.asset('assets/images/saudi-arabia.png'):
                      Image.asset('assets/images/united-states.png'),
                      SizedBox(width: 20,),
                      Icon(Icons.arrow_forward, size: size.height * 0.03)
                    ],
                  ),
                ),
              ),
              Divider(),

              CustomExpansionTile(
                tilePadding: EdgeInsets.only(right: 10),
                collapsedTextColor: Colors.black,
                collapsedIconColor: Colors.black,
                textColor: Constants.mainColor,
                iconColor: Constants.mainColor,
                key: GlobalKey(),
                title: Container(
                  height: size.height * 0.05,
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                            'Cash Out',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: size.height * 0.025),
                          )),

                    ],
                  ),
                ),
                children: [
                  Container(
                    height: size.height*0.07,
                    child: Row(

                      children: [
                        Expanded(
                          child: Container(
                            height: size.height * 0.07,

                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: Colors.black12, width: 1.2),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 10),
                              child: TextField(

                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10),
                                  label: Text(
                                    'Title',
                                    style: TextStyle(
                                      fontSize: size.height * 0.02,
                                      color: Colors.black45,
                                    ),
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: 5,),
                  Container(
                    height: size.height*0.07,
                    child: Row(

                      children: [
                        Container(
                          height: size.height * 0.06,
                          width:size.width * 0.3,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: Colors.black12, width: 1.2),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 10),
                            child: TextField(

                              keyboardType: TextInputType.numberWithOptions(),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(10),
                                label: Text(
                                  'Amount',
                                  style: TextStyle(
                                    fontSize: size.height * 0.02,
                                    color: Colors.black45,
                                  ),
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 20,),
                        Text('SAR',style: TextStyle(fontSize: size.height*0.03,color: Constants.mainColor),)
                      ],
                    ),
                  ),
                  SizedBox(height: 30,),
                  InkWell(
                    onTap: (){
                      viewModel.expand();
                    },
                    child: Container(
                      height: size.height*0.07,
                      width: size.width*0.1,
                      decoration: BoxDecoration(
                          color: Constants.mainColor,
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Center(
                        child: Text('Ok',style: TextStyle(color: Colors.white,fontSize: size.height*0.025),),
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                ],
              ),
              Divider(),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>FinanceOut()));
                },
                child: Container(
                  height: size.height * 0.05,
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        'Logout',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: size.height * 0.025),
                      )),
                      Icon(Icons.arrow_forward, size: size.height * 0.03)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
