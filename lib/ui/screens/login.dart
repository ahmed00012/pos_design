
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shormeh_pos/constants.dart';
import 'package:shormeh_pos/data_controller/home_controller.dart';
import 'package:shormeh_pos/data_controller/login_controller.dart';
import 'finance.dart';
import 'home.dart';

class Login extends  ConsumerWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(loginFuture);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
   backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Card(

                  elevation: 2,
                  child: Container(
                    height: size.height*0.7,
                    width: size.width*0.35,
                    color: Colors.greenAccent.withOpacity(0.2),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Form(
                        key: _formKey,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Login',
                              style: TextStyle(
                                  fontSize: size.height * 0.04,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            TextFormField(
                              controller: viewModel.phoneController,
                              cursorColor: Constants.mainColor,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.phone,
                                  color: Constants.mainColor,
                                ),
                                suffixIcon: viewModel.phoneController.text.isEmpty
                                    ? Text('')
                                    : GestureDetector(
                                    onTap: () {
                                      viewModel.phoneController.clear();
                                    },
                                    child: const Icon(
                                      Icons.close,
                                      color: Constants.mainColor,
                                    )),
                                hintText: 'phone number',
                                label: const Text(
                                  'phone number',
                                  style: TextStyle(color: Constants.mainColor),
                                ),
                                border: const OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                    borderSide: BorderSide(
                                        width: 1, color: Constants.mainColor)),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                  borderSide: BorderSide(
                                      width: 2, color: Constants.mainColor),
                                ),
                              ),
                              // validator: (value){
                              //   if(value!.isEmpty)
                              //     return 'Phone Required';
                              //   return null;
                              //
                              // },
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              obscureText: viewModel.isVisible,
                              controller: viewModel.passwordController,
                              decoration: InputDecoration(
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    // Update the state i.e. toogle the state of passwordVisible variable

                                      viewModel.isVisible = !viewModel.isVisible;

                                  },
                                  child: Icon(
                                    viewModel.isVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.grey,
                                  ),
                                ),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Constants.mainColor,
                                ),
                                hintText: 'password',
                                label: Text(
                                  'password',
                                  style: TextStyle(color: Constants.mainColor),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                    borderSide: BorderSide(
                                        width: 1, color: Constants.mainColor)),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                  borderSide: BorderSide(
                                      width: 2, color: Constants.mainColor),
                                ),
                              ),
                              // validator: (value){
                              //   if(value!.isEmpty)
                              //     return 'Password Required';
                              //   else if( value.length<6)
                              //     return 'Invalid Password';
                              //
                              //   return null;
                              //
                              // },
                            ),
                            SizedBox(
                              height: 70,
                            ),
                            InkWell(
                              onTap: () {

                                // if(_formKey.currentState!.validate()){
                                //   viewModel.login(context);
                                // }
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (_) =>Finance()));
                              },
                              child: Container(
                                height: size.height * 0.07,
                                width: size.width * 0.7,
                                decoration: BoxDecoration(
                                  color: Constants.mainColor,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: size.height * 0.02),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: size.height,
                width: size.width*0.6,
                child: Center(child: Image.asset('assets/images/undraw_Profile_details_re_ch9r.png',fit: BoxFit.fill,)),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
