// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shormeh_pos/bloc/home_bloc/home_bloc.dart';
// import 'package:shormeh_pos/repositories/categories_repository.dart';
//
//
//
// import 'login.dart';
//
// class Splash extends StatefulWidget {
//   @override
//   _SplashState createState() => _SplashState();
// }
//
// class _SplashState extends State<Splash> {
//   CategoriesRepo categoriesRepo = CategoriesRepo();
//   @override
//   void initState() {
//     super.initState();
//     // Timer.periodic(Duration(seconds: 3), (Timer timer) {
//     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BlocProvider(
//       create: (BuildContext context) => HomeBloc(categoriesRepo: categoriesRepo),
//       child: Login(),
//     )));
//
//     // });
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         color: Colors.white,
//         alignment: Alignment.center,
//         child: Container(
//           width: MediaQuery.of(context).size.width*0.6,
//           height: MediaQuery.of(context).size.height*0.35,
//           decoration: new BoxDecoration(
//             image: new DecorationImage(
//               image: AssetImage('assets/images/logo.png',),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
