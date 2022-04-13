import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/card_model.dart';
import '../models/products_model.dart';

final productsFuture =
    ChangeNotifierProvider<ProductsController>((ref) => ProductsController());

class ProductsController extends ChangeNotifier {
  List<Map> dataAllSubCats = [
    {
      'id': 8,
      'price': 12.00,
      'image_one':
          'https://worldapp.site/uploads/transactions/8/3T9XFmLmWhbQmINChVynVJup4Hi3N9zQfX5ddQcj.jpg',
      'name': 'Chicken Shormeh Ragif',
    },
    {
      'id': 9,
      'price': 14.00,
      'image_one':
          'https://worldapp.site/uploads/transactions/9/56KBmbxCcRKeHc9oB7jv2dDJTJmKCPzYdqv6y5qt.jpg',
      'name': 'Meat Shormeh Ragif',
    },
    {
      'id': 10,
      'price': 9.00,
      'image_one':
          'https://worldapp.site/uploads/products/10/1n5hgBMKkKxAtBMNU2BZgf9zCZHY53XhIl2mxZze.jpg',
      'name': 'Falafel Shormeh Ragif',
    },
    {
      'id': 11,
      'price': 14.00,
      'image_one':
          'https://worldapp.site/uploads/products/11/1WgCHswye1PitkBfC4DzcWLoXobZlgA9pBFmiByl.jpg',
      'name': 'quarter meter chicken',
    },
    {
      'id': 12,
      'price': 16.00,
      'image_one':
          'https://worldapp.site/uploads/products/12/i1wtRY5nhYfU7fD0lOn8qubt9iZ23WYiJ8dlpZwL.jpg',
      'name': 'Quarter meter of meat',
    },
    {
      'id': 13,
      'price': 9.00,
      'image_one':
          'https://worldapp.site/uploads/products/13/IogM3xMCWCu0iBFT9M6d8dvHQ8WokE5b0WItbH1n.jpg',
      'name': 'quarter meter falafel',
    },
    {
      'id': 14,
      'price': 11.00,
      'image_one':
          'https://worldapp.site/uploads/products/14/e4WypMxkuQ1Swzy0V658zA2DFXYBf9dskFNls4a9.png',
      'name': 'Shaworger Chicken',
    },
    {
      'id': 15,
      'price': 14.00,
      'image_one':
          'https://worldapp.site/uploads/products/15/JAeYt8ZvLhWU12o8MOfc6PNyCuWpsIEqqQeP4YSS.png',
      'name': 'Shaworger Meat'
    },
    {
      'id': 18,
      'price': 16.00,
      'image_one':
          'https://worldapp.site/uploads/products/18/2zZ2LVGXI9pZe0uacP56h978QTt7MPWsVUm8sKye.jpg',
      'name': 'Shawarma Zaman Chicken',
    },
    {
      'id': 8,
      'price': 12.00,
      'image_one':
          'https://worldapp.site/uploads/transactions/8/3T9XFmLmWhbQmINChVynVJup4Hi3N9zQfX5ddQcj.jpg',
      'name': 'Chicken Shormeh Ragif',
    },
    {
      'id': 18,
      'price': 16.00,
      'image_one':
      'https://worldapp.site/uploads/products/18/2zZ2LVGXI9pZe0uacP56h978QTt7MPWsVUm8sKye.jpg',
      'name': 'Shawarma Zaman Chicken',
    },
    {
      'id': 8,
      'price': 12.00,
      'image_one':
      'https://worldapp.site/uploads/transactions/8/3T9XFmLmWhbQmINChVynVJup4Hi3N9zQfX5ddQcj.jpg',
      'name': 'Chicken Shormeh Ragif',
    },

  ];

  List<ProductsModel> allSubCats = [];
  List<String> drinks = [
    'Pepsi',
    'Sprite',
    'Fanta',
    'Mirinda',
  ];

  List<String> addOn = ['Extra Cheese', 'Extra Sous', 'Ketchup', 'Mayonnaise'];

  List<String> sizes = [
    'Medium',
    'Large',
    'X-Large',
  ];
  List<CardModel> cardItems = [];

  List<String> options= [
    'without Onion',
    'without ketchup',
    'without mayonnaise',
    'without Tomato',
    'without lettuce',
    'without barbecue',
    'without sauce',
    'without pepper',
    'without vinegar',
    'without tome',
  ];

  ProductsController() {
    getAllSubCats(0);
  }

  Future getAllSubCats(int pageKey) async {
    for (int i = 0; i < dataAllSubCats.length; i++) {
      allSubCats.add(ProductsModel(
        dataAllSubCats[i]['id'],
        dataAllSubCats[i]['image_one'],
        dataAllSubCats[i]['name'],
        dataAllSubCats[i]['price'].toString(),
      ));
    }
  }
}
