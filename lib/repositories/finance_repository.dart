import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shormeh_pos/constants.dart';

class FinanceRepository {

  Future cashIn(Map cash,String token) async {
    var response = await http.post(
        Uri.parse("${Constants.baseURL}finance"),body: cash,headers: {'AUTHORIZATION':'Bearer $token'});
    if(response.statusCode==200) {
      var data = json.decode(response.body);
      return data;
    } else {
      return false;
    }
  }

}