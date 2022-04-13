import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:shormeh_pos/local_storage.dart';
import 'package:shormeh_pos/repositories/auth_repository.dart';
import 'package:shormeh_pos/ui/screens/finance.dart';

final loginFuture =
    ChangeNotifierProvider<LoginController>((ref) => LoginController());

class LoginController extends ChangeNotifier {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isVisible = true;

  final AuthRepository _authRepository = AuthRepository();


  login(BuildContext context) async {
    var data = await _authRepository
        .loginCashier({'email': 'a@a.com', 'password': '000000'});
    if (data != false) {
      LocalStorage.saveData(key: 'token', value: data['data']['access_token']);
       LocalStorage.saveData(key: 'username', value: data['data']['employee']['name']);
      LocalStorage.saveData(key: 'branch', value: data['data']['employee']['branch_id']);
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Finance()));
    } else {
      displayToastMessage('Wrong name or password');
    }

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
