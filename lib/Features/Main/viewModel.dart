import 'package:flutter/material.dart';
import 'package:food_delivery_front_end/Features/home/view/home_view.dart';
import 'package:food_delivery_front_end/Features/order/view/cart_view_page.dart';

class MainViewModle {
  String homeLable = "Home";
  String chatlable = "Chat";
  String profilelable = "Profile";
  String cartLable = "Cart";

  int selcetPage = 0;
  List<Widget> get pages {
    return [HomeView(), Container(), CartViewPage(), Container()];
  }
}
