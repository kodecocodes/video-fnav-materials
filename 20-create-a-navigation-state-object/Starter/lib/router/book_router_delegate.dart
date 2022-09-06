import '../helpers/book_data.dart';
import '../screens/cart_screen.dart';
import '../screens/checkout_screen.dart';
import '../screens/detail_screen.dart';
import '../screens/home_screen.dart';
import '../screens/login_screen.dart';
import '../screens/my_books_screen.dart';
import '../screens/read_book_screen.dart';
import '../screens/settings_screen.dart';
import '../screens/signup_screen.dart';
import '../screens/splash_screen.dart';
import 'app_state_manager.dart';
import 'package:flutter/material.dart';

import 'book_pages.dart';

class BookRouterDelegate extends RouterDelegate<AppStateManager>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final AppStateManager appStateManager;
  final BookManager bookManager;

  @override
  final GlobalKey<NavigatorState> navigatorKey;

  BookRouterDelegate({required this.bookManager, required this.appStateManager})
      : navigatorKey = GlobalKey<NavigatorState>() {
    appStateManager.addListener(notifyListeners);
    bookManager.addListener(notifyListeners);
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onPopPage: _handelPopPages,
      key: navigatorKey,
      pages: [
        if (!appStateManager.isInitialized) SplashScreen.page(),
        if (appStateManager.isInitialized && !appStateManager.isLoggedIn)
          LoginScreen.page(),

        //Sign Up Screen
        if (appStateManager.isInitialized && appStateManager.isSignUp)
          SignupScreen.page(),

        // Home Screen
        if (appStateManager.isLoggedIn ||
            !appStateManager.isSignUp && appStateManager.onSignUpComplete)
          HomeScreen.page(),

        //Cart Screen
        if (appStateManager.onCart ||
            appStateManager.onCart && bookManager.selectedIndex != -1 ||
            appStateManager.onCart &&
                appStateManager.onReadBook &&
                bookManager.selectedIndex != -1)
          CartScreen.page(),

        // Settings Screen
        if (appStateManager.onSettings ||
            appStateManager.onSettings && bookManager.selectedIndex != -1 ||
            appStateManager.onSettings &&
                appStateManager.onReadBook &&
                bookManager.selectedIndex != -1 &&
                !appStateManager.onCart)
          SettingsScreen.page(),

        // Checkout Screen
        if (appStateManager.onCheckout) CheckoutScreen.page(),

        // My Book Screen
        if (appStateManager.onMyBooks) MyBooksScreen.page(),

        //Details Screen
        if (bookManager.selectedIndex != -1 &&
            !appStateManager.onCart &&
            !appStateManager.onSettings)
          DetailsScreen.page(
              book: bookManager.selectedBookItem,
              index: bookManager.selectedIndex),

        // Read Book Screen
        if (appStateManager.onReadBook &&
            bookManager.selectedIndex != -1 &&
            !appStateManager.onCart &&
            !appStateManager.onSettings)
          ReadBookScreen.page(bookManager.selectedBookItem)
      ],
    );
  }

  bool _handelPopPages(Route<dynamic> route, result) {
    if (!route.didPop(result)) {
      return false;
    }

    if (route.settings.name == BookPages.loginPath ||
        route.settings.name == BookPages.signupPath ||
        route.settings.name == BookPages.homePath) {
      appStateManager.logout();
    }

    if (route.settings.name == BookPages.detailsPath) {
      bookManager.bookTapped(-1);
    }
    if (route.settings.name == BookPages.cartPath) {
      appStateManager.onCartTapped(false);
    }
    if (route.settings.name == BookPages.settingsPath) {
      appStateManager.onSettingTapped(false);
    }
    if (route.settings.name == BookPages.checkoutPath) {
      appStateManager.onCheckoutTapped(false);
    }
    if (route.settings.name == BookPages.mybooksPath) {
      appStateManager.onMyBookTapped(false);
    }
    if (route.settings.name == BookPages.readBookPath) {
      appStateManager.onReadBookTapped(false);
    }

    return true;
  }

  @override
  Future<void> setNewRoutePath(configuration) async => null;

  @override
  void dispose() {
    appStateManager.removeListener(notifyListeners);
    bookManager.removeListener(notifyListeners);
    super.dispose();
  }
}
