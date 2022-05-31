import 'package:flutter/material.dart';

class ModalService extends ChangeNotifier {

  bool _isActive = false;

  bool get isActiveGet{
    return _isActive;
  }

  set isActiveSet (bool active ){
    _isActive = active;
  }

  
}