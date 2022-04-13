import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:shormeh_pos/local_storage.dart';
import 'package:shormeh_pos/repositories/finance_repository.dart';
import 'package:shormeh_pos/ui/screens/home.dart';

final financeFuture =
    ChangeNotifierProvider.autoDispose<FinanceController>((ref) => FinanceController());

class FinanceController extends ChangeNotifier {
  List<String> cashIn = [];
  List<String> visaIn = [];
  List<String> cashInInit = [];

  bool chosenCash = true;
  bool chosenVisa = false;
  double cash= 0.0;
  double visa= 0.0;

  final FinanceRepository _financeRepository = FinanceRepository();


  FinanceController(){
    chosenCash=true;
    notifyListeners();
  }

  addNumber(String e) {
    if(chosenCash)
    cashIn.add(e);
    if(chosenVisa)
      visaIn.add(e);
    notifyListeners();
  }

  addNumInit(String e){
    cashInInit.add(e);
    notifyListeners();
  }

  removeNumber() {
    if(chosenCash)
    cashIn.remove(cashIn.last);
     if(chosenVisa)
      visaIn.remove(visaIn.last);
    notifyListeners();
  }

  removeNumberInit() {
      cashInInit.remove(cashInInit.last);
    notifyListeners();
  }

  visaCashSwap(int swap){
    if(swap==0) {
      chosenVisa = false;
      chosenCash = true;
    }
    else {
      chosenVisa = true;
      chosenCash = false;
    }
    notifyListeners();
  }

  doneButtonCashIn(BuildContext context) async {
    cashIn = [];
    var data = await _financeRepository.cashIn(
        {'status': '1', 'cash': int.parse(cashIn.join().toString())},
        LocalStorage.getData(key: 'token'));
    if (data != false) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    }
    notifyListeners();
  }

  cashInDone(){
    chosenCash= false;
    chosenVisa =true;
    notifyListeners();
  }

  visaInDone(){
    chosenCash= false;
    chosenVisa =false;
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
