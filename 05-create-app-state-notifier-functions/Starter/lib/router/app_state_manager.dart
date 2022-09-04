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
}
