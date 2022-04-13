

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shormeh_pos/ui/widgets/custom_expansion_tile.dart';

final moreFuture =
ChangeNotifierProvider<MoreController>((ref) => MoreController());

class MoreController extends ChangeNotifier {


  String lan = 'en';

  changeLanguage(){
    lan=='en'? lan ='ar':lan = 'en';
    notifyListeners();
  }

  expand(){
    // CustomExpansionTile.handleTap();
    notifyListeners();
  }

}