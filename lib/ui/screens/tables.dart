import 'package:flutter/material.dart';
import 'package:shormeh_pos/models/tables_model.dart';

import '../../constants.dart';


class Tables extends StatefulWidget {
  const Tables({Key? key}) : super(key: key);

  @override
  _TablesState createState() => _TablesState();
}

class _TablesState extends State<Tables> {

  List<String> status= [
    'Free',
    'busy',
    'late'
  ];
  List<TablesModel> tables = [
    TablesModel(
      num: 1,
      status: 'Free',
    ),
    TablesModel(
      num: 2,
      status: 'Free',
    ),
    TablesModel(
      num: 3,
      status: 'busy',
    ),
    TablesModel(
      num: 4,
      status: 'busy',
    ),
    TablesModel(
      num: 5,
      status: 'Free',
    ),
    TablesModel(
      num: 6,
      status: 'Free',
    ),
    TablesModel(
      num: 7,
      status: 'late',
    ),
    TablesModel(
      num: 8,
      status: 'Free',
    ),
    TablesModel(
      num: 9,
      status: 'Free',
    ),
    TablesModel(
      num: 10,
      status: 'Free',
    ),
    TablesModel(
      num: 11,
      status: 'late',
    ),
    TablesModel(
      num: 12,
      status: 'Free',
    ),
  ];


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
          GridView.builder(
            itemCount: 12,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio:1.8,
            ),
            itemBuilder:
                (context, i) {
              return Card(
                shape:
                RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius
                      .circular(
                      10.0),
                ),
                child:
                InkWell(
                  onTap: (){
                    int index = status.indexOf(tables[i].status!);
                    setState(() {
                      if(index == status.length-1)
                        tables[i].status=status[0];
                      else
                        tables[i].status=status[index+1];

                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: tables[i].status=='late'?
                        Constants.colorRed:
                        tables[i].status=='busy'? Constants.secondryColor
                            .withOpacity(
                            0.3):Colors.white,
                        borderRadius:
                        BorderRadius.circular(
                            10.0),
                        border: Border.all(
                            color:tables[i].status=='late'?
                            Colors
                                .red :
                            tables[i].status=='busy'? Constants.secondryColor:Constants.mainColor,
                            width:
                            1)),
                    child: Center(
                      child: Text(
                        'Table ${tables[i].num}',
                        style: TextStyle(
                          color:tables[i].status=='late'?Colors.white:tables[i].status=='busy'? Colors.black54: Constants.mainColor,
                            fontSize:
                            size.height * 0.03),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          SizedBox(
            height: size.height*0.1,
          )
        ],
      ),
    );
  }
}
