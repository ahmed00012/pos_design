import 'package:flutter/material.dart';
import 'package:shormeh_pos/constants.dart';

class CategoryWidget extends StatelessWidget {
  String? image;
  String? name;
  CategoryWidget({this.image,this.name});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: [
            Flexible(
              child: Image.network(image!,
                fit: BoxFit.cover,
                width: size.width,

              ),
            ),
            Padding(padding:EdgeInsets.only(top: 10,bottom: 5),
              child: Center(
                child: Text(
                name!,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize:size.height*0.022,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ),),
            Container(
              height: 5,
              width: size.width,
              color: Constants.mainColor,
            )
          ],
        ),
      ),
    );
  }
}
