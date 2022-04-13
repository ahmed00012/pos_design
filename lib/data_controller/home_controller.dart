import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:shormeh_pos/models/order_model.dart';
import 'package:shormeh_pos/models/tables_model.dart';

import '../local_storage.dart';
import '../models/card_model.dart';
import '../models/categories_model.dart';
import '../models/payment_model.dart';
import '../repositories/categories_repository.dart';
import '../ui/screens/home.dart';
import '../ui/screens/orders.dart';
import '../ui/screens/tables.dart';

final dataFuture =
    ChangeNotifierProvider<HomeController>((ref) => HomeController());

class HomeController extends ChangeNotifier {
  CategoriesRepo categoriesRepo = CategoriesRepo();
  var categories = [];
  bool products = false;
  List<CardModel> cardItems = [];
  List<OrderModel> orderItems = [];
  double total = 0.0;
  bool paymentWidget = false;
  int index = -1;
  TextEditingController search = TextEditingController();
  TextEditingController customerName = TextEditingController();
  TextEditingController customerPhone = TextEditingController();
  TextEditingController coupon = TextEditingController();
  TextEditingController amount = TextEditingController();
  TextEditingController notes = TextEditingController();
  var selectedTab = SelectedTab.home;
  Widget current = Home();
  bool orderMethod = false;
  String? chosenOrderMethod = 'Take Away';
  int? chosenItem;
  int? chosenOrderItem;
  bool tablesWidget = false;
  bool itemWidget = false;
  double tax = 0.0;
  String chosenPayment = 'Cash';
  bool newHome = false;
  bool options = false;
  List<String> countText = [];

  bool loginSuccess = false;

  List<PaymentModel> paymentType = [
    PaymentModel(
      title: 'Cash',
      chosen: true,
    ),
    PaymentModel(
      title: 'Visa',
      chosen: false,
    ),
    PaymentModel(
      title: 'Master Card',
      chosen: false,
    ),
    PaymentModel(
      title: 'Points',
      chosen: false,
    ),
  ];

  List<TablesModel> tables = [
    TablesModel(num: 1, status: 'Free', busy: false),
    TablesModel(num: 2, status: 'busy', busy: true),
    TablesModel(num: 3, status: 'Free', busy: false),
    TablesModel(num: 4, status: 'Free', busy: false),
    TablesModel(num: 5, status: 'Free', busy: false),
    TablesModel(num: 6, status: 'Free', busy: false),
    TablesModel(num: 7, status: 'Free', busy: false),
    TablesModel(num: 8, status: 'busy', busy: true),
    TablesModel(num: 9, status: 'Free', busy: false),
    TablesModel(num: 10, status: 'Free', busy: false),
    TablesModel(num: 11, status: 'Free', busy: false),
    TablesModel(num: 12, status: 'Free', busy: false),
  ];

  List<Widget> pages = [
    Orders(),
    Home(),
    Tables(),
    // Splash()
  ];

  HomeController() {
    if (!products) {
      const oneSecond = Duration(milliseconds: 50);
      Timer.periodic(oneSecond, (Timer t) => notifyListeners());
    }
    getCategories('6');
    notifyListeners();
  }

  setIndex(int i) {
    index = i;
    notifyListeners();
  }

  selectPayment(int i) {
    paymentType.forEach((element) {
      element.chosen = false;
    });
    chosenPayment = paymentType[i].title!;
    paymentType[i].chosen = true;
    notifyListeners();
  }

  donePayment(int i) {
    emptyCardList();
    switchToPaymentWidget(true);
    switchToCategories(false);
    paymentType.forEach((element) {
      element.chosen = false;
    });
    coupon.text = '';
    customerName.text = '';
    customerPhone.text = '';
    chosenPayment = paymentType[i].title!;
    notifyListeners();
  }

  removeCartItem(int i) {
    total = 0.0;
    cardItems.removeAt(i);
    cardItems.forEach((element) {
      total = total + element.price!;
    });
    notifyListeners();
  }

  emptyCardList() {
    cardItems = [];
    notifyListeners();
  }

  switchToCategories(bool switchTo) {
    products = switchTo;
    notifyListeners();
  }

  switchToPaymentWidget(bool switchTo) {
    paymentWidget = switchTo;
    notifyListeners();
  }

  switchToOrderMethodWidget(bool switchTo) {
    orderMethod = switchTo;
    notifyListeners();
  }

  switchToCardItemWidget(bool switchTo, {int? i}) {
    itemWidget = switchTo;
    chosenItem = i;
    notifyListeners();
  }

  setOrderMethod(String orderMethod) {
    chosenOrderMethod = orderMethod;
    if (orderMethod == 'Dine In')
      tablesWidget = true;
    else
      tablesWidget = false;
    notifyListeners();
  }

  reserveTable(int i) {
    tables.forEach((element) {
      if (element.busy! && element.status == 'Free') element.busy = false;
    });
    tables[i].busy = !tables[i].busy!;

    notifyListeners();
  }

  minusController(int i) {
    if (cardItems[i].count! > 1) {
      cardItems[i].count = cardItems[i].count! - 1;
      cardItems[i].total = cardItems[i].price! * cardItems[i].count!;
      total = total - cardItems[i].price!;
      notifyListeners();
    }
  }

  plusController(int i) {
    cardItems[i].count = cardItems[i].count! + 1;
    cardItems[i].total = cardItems[i].price! * cardItems[i].count!;
    cardItems.forEach((element) {
      total = total + element.price!;
    });
    notifyListeners();
  }

  textCountController(int i) {
    cardItems[i].total = cardItems[i].price! * cardItems[i].count!;
    cardItems.forEach((element) {
      total = total + element.total!;
    });
    notifyListeners();
  }

  getCategories(String id) async {
    var data = await categoriesRepo.getAllCategories();
    categories =
        data.map((category) => CategoriesModel.fromJson(category)).toList();
    categories[1].chosen= true;

    // var data = await categoriesRepo.getAllCategories(
    //   '1',
    //   LocalStorage.getData(key: 'token'),
    // );

    notifyListeners();
  }

  chooseCategory(int i) {
    if (i == 0) {
      categories.forEach((element) {
        element.chosen = false;
      });
      options = true;
    } else {
      categories.forEach((element) {
        element.chosen = false;
      });
      categories[i].chosen = true;
    }
    notifyListeners();
  }

  void onHorizontalDrag(DragEndDetails details) {
    if (details.primaryVelocity == 0) return;

    if (details.primaryVelocity!.compareTo(0) == -1) {
      return;
    } else {
      products = false;
      notifyListeners();
    }
  }

  void handleIndexChanged(int i) {
    selectedTab = SelectedTab.values[i];
    current = pages[i];
    notifyListeners();
  }

  void displayToastMessage(var toastMessage) {
    showSimpleNotification(
        Container(
          height: 50,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Center(
              child: Text(
                toastMessage,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
        duration: Duration(seconds: 3),
        elevation: 2,
        background: Colors.red[500]);
  }
}
