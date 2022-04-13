
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:shormeh_pos/ui/screens/login.dart';

import 'constants.dart';
import 'local_storage.dart';

void main() {

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft,DeviceOrientation.landscapeRight]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    LocalStorage.init();
        return OverlaySupport.global(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: 'RobotoCondensed',
              scaffoldBackgroundColor: Constants.scaffoldColor,
              textSelectionTheme: TextSelectionThemeData(
                cursorColor: Constants.mainColor,
                selectionColor: Constants.mainColor,
                selectionHandleColor:Constants.mainColor,
              ),
            ),
            home: Login(),
          ),
        );

  }
}