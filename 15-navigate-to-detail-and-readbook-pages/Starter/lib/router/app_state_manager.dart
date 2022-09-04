import 'dart:async';

import 'package:flutter/material.dart';

class AppStateManager extends ChangeNotifier {
  bool _initialised = false;
  bool _loggedIn = false;
  bool _isSignUp = false;
  bool _onSignUpComplete = false;
  bool _onCart = false;
  bool _onSetting = false;
  bool _onCheckout = false;
  bool _onMyBooks = false;
  bool _onReadBook = false;

  bool get isInitialized => _initialised;
  bool get isLoggedIn => _loggedIn;
  bool get isSignUp => _isSignUp;
  bool get onSignUpComplete => _onSignUpComplete;
  bool get onCart => _onCart;
  bool get onSettings => _onSetting;
  bool get onCheckout => _onCheckout;
  bool get onMyBooks => _onMyBooks;
  bool get onReadBook => _onReadBook;

  void initislizeApp() {
    Timer(const Duration(milliseconds: 2000), () {
      _initialised = true;

      notifyListeners();
    });
  }

  void login(String username, String password) {
    _loggedIn = true;

    notifyListeners();
  }


  void logout() {
    _loggedIn = false;
    _onSignUpComplete = false;
    _initialised = false;
   
    initislizeApp();
  }

    void onCartTapped(bool value) {
    _onCart = value;
    notifyListeners();
  }

    void onSettingTapped(bool value) {
    _onSetting = value;
    notifyListeners();
  }


  void onCheckoutTapped(bool value) {
    _onCheckout = value;
    notifyListeners();
  }

  void onMyBookTapped(bool value) {
    _onMyBooks = value;
    notifyListeners();
  }

  void onReadBookTapped(bool value) {
    _onReadBook = value;
    notifyListeners();
  }

    void onsignUpTapper(bool value) {
    _isSignUp = value;
    notifyListeners();
  }


  void onSignUpCompleted() {
    _loggedIn = true;
    _isSignUp = false;
    _onSignUpComplete = true;
    notifyListeners();
  }

}
