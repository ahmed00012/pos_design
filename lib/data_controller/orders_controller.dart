import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shormeh_pos/models/card_model.dart';
import 'package:shormeh_pos/models/order_model.dart';
import 'package:shormeh_pos/models/payment_model.dart';

import '../constants.dart';

final ordersFuture =
    ChangeNotifierProvider.autoDispose<OrdersController>((ref) => OrdersController());

class OrdersController extends ChangeNotifier {
  List<OrderModel> filteredOrders = [];
  DateTime selectedDate = DateTime.now();
  List<PaymentModel> filter = [
    PaymentModel(title: 'Hall', chosen: false),
    PaymentModel(title: 'Take Away', chosen: false),
    PaymentModel(title: 'Cash', chosen: false),
    PaymentModel(title: 'Visa', chosen: false),
  ];
  List<OrderModel> orders = [
    OrderModel(
        products: [
          CardModel(
              total: 75,
              mainName: 'Shawerma',
              drink: 'Apple',
              count: 2,
              extra: ['Salad'],
              size: 'Large',
              price: 75,
              id: 2),
          CardModel(
              total: 12,
              mainName: 'Shawerma',
              drink: 'Apple',
              count: 1,
              extra: ['Extra Cheese'],
              size: 'Medium',
              price: 12,
              id: 3),
          CardModel(
              total: 75,
              mainName: 'Shawerma',
              drink: 'Orange',
              count: 2,
              extra: ['Salad'],
              size: 'Large',
              price: 75,
              id: 5),
        ],
        status: 'New',
        orderMethod: 'Hall',
        table: 2,
        payment: 'Cash',
        type: 'Meal'),
    OrderModel(
        products: [
          CardModel(
              total: 55,
              mainName: 'Shawerma',
              drink: 'Pepsi',
              count: 2,
              extra: ['Extra Sous'],
              size: 'x-Large',
              price: 55,
              id: 1),
          CardModel(
              total: 75,
              mainName: 'Shawerma',
              drink: 'Apple',
              count: 2,
              extra: ['Salad'],
              size: 'Large',
              price: 75,
              id: 0),
          CardModel(
              total: 12,
              mainName: 'Shawerma',
              drink: 'Apple',
              count: 1,
              extra: ['Salad'],
              size: 'Large',
              price: 12,
              id: 4),
        ],
        status: 'Processing',
        orderMethod: 'Hall',
        table: 7,
        payment: 'Visa',
        type: 'Appetizers'),
    OrderModel(
        products: [
          CardModel(
              total: 75,
              mainName: 'Shawerma',
              drink: 'Apple',
              count: 2,
              extra: ['Extra Cheese'],
              size: 'Medium',
              price: 75,
              id: 6),
          CardModel(
              total: 12,
              mainName: 'Shawerma',
              drink: 'Apple',
              count: 1,
              extra: ['Salad'],
              size: 'X-Large',
              price: 12,
              id: 3),
        ],
        status: 'Finished',
        orderMethod: 'Hall',
        table: 5,
        payment: 'Cash',
        type: 'Meal'),
    OrderModel(
        products: [
          CardModel(
              total: 75,
              mainName: 'Shawerma',
              drink: 'Apple',
              count: 2,
              extra: ['Salad'],
              size: 'Large',
              price: 75,
              id: 7),
          CardModel(
              total: 75,
              mainName: 'Shawerma',
              drink: 'Apple',
              count: 2,
              extra: ['Extra Cheese', 'Extra Sous'],
              size: 'Medium',
              price: 75,
              id: 2),
          CardModel(
              total: 12,
              mainName: 'Shawerma',
              drink: 'Apple',
              count: 1,
              extra: ['Ketchup'],
              size: 'Large',
              price: 12,
              id: 3),
        ],
        status: 'New',
        orderMethod: 'Take Away',
        payment: 'Visa',
        type: 'Appetizers'),
    OrderModel(
        products: [
          CardModel(
              total: 75,
              mainName: 'Shawerma',
              drink: 'Apple',
              count: 2,
              extra: ['Ketchup', 'Mayonnaise'],
              size: 'X-Large',
              price: 75,
              id: 7),
        ],
        status: 'Processing',
        orderMethod: 'Take Away',
        payment: 'Cash',
        type: 'Meal'),
    OrderModel(
        products: [
          CardModel(
              total: 85,
              mainName: 'Shawerma',
              drink: 'Apple',
              count: 2,
              extra: ['Ketchup', 'Mayonnaise'],
              size: 'X-Large',
              price: 75,
              id: 2),
          CardModel(
              total: 25,
              mainName: 'Shawerma',
              drink: 'Apple',
              count: 1,
              extra: ['sous'],
              size: 'Large',
              price: 12,
              id: 3),
          CardModel(
              total: 75,
              mainName: 'Shawerma',
              drink: 'Orange',
              count: 2,
              extra: ['Salad'],
              size: 'X-Large',
              price: 75,
              id: 5),
          CardModel(
              total: 55,
              mainName: 'Shawerma',
              drink: 'Pepsi',
              count: 2,
              extra: ['Mayonnaise'],
              size: 'x-Large',
              price: 55,
              id: 9),
        ],
        status: 'Finished',
        table: 5,
        orderMethod: 'Hall',
        payment: 'Cash',
        type: 'Meal'),
    OrderModel(
        products: [
          CardModel(
              total: 85,
              mainName: 'Shawerma',
              drink: 'Apple',
              count: 2,
              extra: ['Ketchup', 'Mayonnaise'],
              size: 'X-Large',
              price: 75,
              id: 2),
          CardModel(
              total: 25,
              mainName: 'Shawerma',
              drink: 'Apple',
              count: 1,
              extra: ['sous'],
              size: 'Large',
              price: 12,
              id: 3),
          CardModel(
              total: 75,
              mainName: 'Shawerma',
              drink: 'Orange',
              count: 2,
              extra: ['Salad'],
              size: 'X-Large',
              price: 75,
              id: 5),
          CardModel(
              total: 55,
              mainName: 'Shawerma',
              drink: 'Pepsi',
              count: 2,
              extra: ['Mayonnaise'],
              size: 'x-Large',
              price: 55,
              id: 9),
        ],
        status: 'Finished',
        table: 5,
        orderMethod: 'Hall',
        payment: 'Cash',
        type: 'Meal')
  ];

  int index = 0;
  int? chosenOrder;
  String status = 'All';



  OrdersController() {
    initState();
  }

  initState() {
    filteredOrders = orders;
  }

  allTapCantroller() {
    index = 0;
    filteredOrders = [];
    status='All';
    filter.forEach((element) {element.chosen=false;});
    filteredOrders = orders;

    notifyListeners();
  }

  newOrdersController() {
    index = 1;
    filteredOrders = [];
    status = 'New';
    filter.forEach((element) {element.chosen=false;});
    filteredOrders = orders.where((x) => x.status == 'New').toList();

    notifyListeners();
  }

  finishedOrdersController() {
    index = 2;
    filteredOrders = [];
    status = 'Finished';
    filter.forEach((element) {element.chosen=false;});
    filteredOrders = orders.where((x) => x.status == 'Finished').toList();

    notifyListeners();
  }

  filterOrders(int i) {

    filter.forEach((element) {element.chosen=false;});
    if (i == 0) {
      if(status == 'All')
       filteredOrders =
          orders.where((x) => x.orderMethod == 'Hall').toList();
      else
        filteredOrders =
          orders.where((x) => x.orderMethod == 'Hall' && x.status == status).toList();
      filter[0].chosen = true;
    }

    if (i == 1) {
      if(status == 'All')
      filteredOrders =
          orders.where((x) => x.orderMethod == 'Take Away').toList();
      else
      filteredOrders =
          orders.where((x) => x.orderMethod == 'Take Away'&& x.status == status).toList();
      filter[1].chosen = true;
    }

    if (i == 2) {
      if(status == 'All')
          filteredOrders = orders.where((x) => x.payment == 'Cash').toList();
      else
          filteredOrders = orders.where((x) => x.payment == 'Cash'&& x.status == status).toList();
      filter[2].chosen = true;
    }

    if (i == 3 ) {
      if(status == 'All')
          filteredOrders = orders.where((x) => x.payment == 'Visa').toList();
      else
      filteredOrders = orders.where((x) => x.payment == 'Visa'&& x.status == status).toList();
      filter[3].chosen = true;
    }

    notifyListeners();
  }


  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(

        context: context,
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: Constants.mainColor,
              colorScheme: ColorScheme.light(primary: Constants.mainColor),
              buttonTheme: ButtonThemeData(
                  textTheme: ButtonTextTheme.primary
              ),
            ),
            child: child!,
          );
        },
        initialDate: selectedDate,
        firstDate: DateTime(DateTime.now().year- 1),
        lastDate: DateTime(DateTime.now().year+ 1));


    if (picked != null && picked != selectedDate)
        selectedDate = picked;
    notifyListeners();

  }
}
