import 'package:flutter/material.dart';


class NavBarService extends ChangeNotifier {

  int _seletedMenuOpt = 0;

  int get seletedMenuOptGet{
    return _seletedMenuOpt;
  }

  set seletedMenuOptSet(int opc){
    _seletedMenuOpt = opc;
    notifyListeners();
  }  
}