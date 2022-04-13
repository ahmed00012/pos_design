
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shormeh_pos/constants.dart';

class AuthRepository {

  Future loginCashier(Map user) async {
    var response = await http.post(
        Uri.parse("${Constants.baseURL}auth/cashier/login"),body: user);
    if(response.statusCode==200) {
      var data = json.decode(response.body);
      return data;
    } else {
      return false;
    }
  }

}