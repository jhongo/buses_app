import 'package:flutter/material.dart';


class SliderModel extends ChangeNotifier {

  double _currentPage = 0; 


  double get currentPageGet{
    return _currentPage;
  }

  set currentPageSet(double index){
    _currentPage = index;
    notifyListeners();
  }
  
}