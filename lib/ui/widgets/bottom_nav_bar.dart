import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shormeh_pos/data_controller/home_controller.dart';
import 'package:shormeh_pos/ui/screens/home.dart';

import '../../constants.dart';

class BottomNavBar extends ConsumerWidget {

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final viewModel = ref.watch(dataFuture);
    Size size = MediaQuery.of(context).size;
    return  Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: DotNavigationBar(
          margin: EdgeInsets.only(
              left: 10, right: 10),
          boxShadow: [
            BoxShadow(
              color:
              Colors.grey.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 1,
            )
          ],
          currentIndex: SelectedTab.values
              .indexOf(viewModel.selectedTab),
          dotIndicatorColor: Colors.white,
          unselectedItemColor: Colors.black26,
          selectedItemColor:  Constants.mainColor,
          // enableFloatingNavBar: false,
          onTap: viewModel.handleIndexChanged,

          items: [
            /// history
            DotNavigationBarItem(
              icon: Row(
                crossAxisAlignment:
                CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.history,
                    size: size.height * 0.03,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'orders',
                    style: TextStyle(
                        fontSize:
                        size.height * 0.02,
                        color: viewModel
                            .selectedTab ==
                            SelectedTab
                                .orders
                            ?  Constants.mainColor
                            : Colors.black45),
                  )
                ],
              ),
              // selectedColor: Constants.colorGreen,
              // unselectedColor: Constants.colorGreen,
            ),

            /// home
            DotNavigationBarItem(
              icon: Row(
                crossAxisAlignment:
                CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.home,
                    size: size.height * 0.03,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Home',
                    style: TextStyle(
                        fontSize:
                        size.height * 0.02,
                        color: viewModel
                            .selectedTab ==
                            SelectedTab.home
                            ?  Constants.mainColor
                            : Colors.black45),
                  )
                ],
              ),
            ),

            /// menu
            DotNavigationBarItem(
              icon: Row(
                crossAxisAlignment:
                CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.view_comfortable,
                    size: size.height * 0.03,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Tables',
                    style: TextStyle(
                        fontSize:
                        size.height * 0.02,
                        color: viewModel
                            .selectedTab ==
                            SelectedTab
                                .tables
                            ?  Constants.mainColor
                            : Colors.black45),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
