import 'package:flutter/material.dart';

class RoutingProvider extends ChangeNotifier {
  final PageController _pageController = PageController();
  int _pageIndex = 0;
  bool _isScreenLoading = false;

  // Getters
  PageController get pageController => _pageController;
  int get pageIndex => _pageIndex;
  bool get isScreenLoading => _isScreenLoading;

  // Setters
  setPageIndex(int index) {
    _pageIndex = index;
    notifyListeners();
  }

  setScreenLoading(bool isLoading) {
    _isScreenLoading = isLoading;
    notifyListeners();
  }
}