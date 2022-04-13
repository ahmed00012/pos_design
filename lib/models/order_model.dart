
import 'package:shormeh_pos/models/card_model.dart';

class OrderModel{
List<CardModel>? products ;
String? status;
String? orderMethod;
int? table;
String? payment;
String? type;
OrderModel({this.products,this.status,this.table,this.orderMethod,this.payment,this.type});
}