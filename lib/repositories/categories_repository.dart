import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constants.dart';

class CategoriesRepo {

  //String branchID, String token
  Future getAllCategories() async {

    // var response = await http.get(
    //   Uri.parse("${Constants.baseURL}branch/1/categories"),
    // headers:  {'AUTHORIZATION':'Bearer $token'},
    // );
    // if(response.statusCode==200){
    //   var data = json.decode(response.body);
    //   return data;
    // }
    // else return false;

    return  [
      {'id': 3,
    'image': 'https://worldapp.site/uploads/categories/3/znQcGLSP6rcJJsfqIS2PHkXLY9khdUsjAc9otiUA.jpg',
   'name': 'Special Shormeh',},
    {'id': 5,
   'image': 'https://worldapp.site/uploads/categories/5/yckFJtUl5jB3nJihoaBhERHUS95vaOajayKalTSb.jpg',
    'name': 'Meals',},
    {'id': 1,
    'image': 'https://worldapp.site/uploads/categories/1/PDKsqky4CklYv2gCkV8KQPGvDJWQfVuc0DX6QPTR.jpg',
     'name': 'Asli',},
    {'id': 6,
    'image': 'https://worldapp.site/uploads/categories/6/RIZ47Cy9bMr7w5vBp7wwxpYEfGrrAbSuyGokvbNd.jpg',
    'name': 'Jamat - groups',},
    {'id': 7,
    'image': 'https://worldapp.site/uploads/categories/7/R9PJ0vI1FLsavXRhh2DT4rbw5oQefW4ZWRoj5pbg.jpg',
     'name': 'Concrete and Fries', },
    {'id': 8,
    'image': 'https://worldapp.site/uploads/categories/8/6yVxZ29qZOvWl5VyDF6IIxnZmrxmx4VUp2oymYdf.png',
   'name': 'Appetizers and salads',},
    {'id': 9,
    'image': 'https://worldapp.site/uploads/categories/9/2QimKhGn2kDMgCBBeGdah9HQlIVnNSnjIVc80OvH.jpg',
     'name': 'Souses', },
      {'id': 3,
        'image': 'https://worldapp.site/uploads/categories/3/znQcGLSP6rcJJsfqIS2PHkXLY9khdUsjAc9otiUA.jpg',
        'name': 'Special Shormeh',},
      {'id': 5,
        'image': 'https://worldapp.site/uploads/categories/5/yckFJtUl5jB3nJihoaBhERHUS95vaOajayKalTSb.jpg',
        'name': 'Meals',},
      {'id': 1,
        'image': 'https://worldapp.site/uploads/categories/1/PDKsqky4CklYv2gCkV8KQPGvDJWQfVuc0DX6QPTR.jpg',
        'name': 'Asli',},
      {'id': 6,
        'image': 'https://worldapp.site/uploads/categories/6/RIZ47Cy9bMr7w5vBp7wwxpYEfGrrAbSuyGokvbNd.jpg',
        'name': 'Jamat - groups',},
      {'id': 7,
        'image': 'https://worldapp.site/uploads/categories/7/R9PJ0vI1FLsavXRhh2DT4rbw5oQefW4ZWRoj5pbg.jpg',
        'name': 'Concrete and Fries', },
      {'id': 8,
        'image': 'https://worldapp.site/uploads/categories/8/6yVxZ29qZOvWl5VyDF6IIxnZmrxmx4VUp2oymYdf.png',
        'name': 'Appetizers and salads',},
      {'id': 9,
        'image': 'https://worldapp.site/uploads/categories/9/2QimKhGn2kDMgCBBeGdah9HQlIVnNSnjIVc80OvH.jpg',
        'name': 'Souses', },
];
  }

}