import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/view/home_view.dart';
import 'package:getx/view/profile_view.dart';

class ControlViewModel extends GetxController {
  int _navigatorValue = 0;

  get navigatorValue => _navigatorValue;
  Widget _currentView = HomeView();
  get currentView => _currentView;
  void changeSelectedValue(int selectedValue) {
    _navigatorValue = selectedValue;
    switch (selectedValue) {
      case 0:
        {
          _currentView = HomeView();
          break;
        }       
      case 1:
        {
          _currentView = ProfileView();
        }
    }
    update();
  }
}
