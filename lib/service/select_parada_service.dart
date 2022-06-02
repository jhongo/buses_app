import 'package:flutter/material.dart';

class SelectParadaService extends ChangeNotifier {

  int _currentPage = 0;
  final PageController _pageController = PageController();

  int get currentPageGet{
    return _currentPage;
  }

  set currentPageSet(int page ){
    _currentPage = page;
    _pageController.animateToPage(page, duration: Duration(milliseconds: 250), curve: Curves.easeOut);
    notifyListeners();
  }
  PageController get pageControllerGet => _pageController;
  
  
}