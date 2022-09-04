import '../helpers/book_data.dart';
import '../screens/login_screen.dart';
import '../screens/splash_screen.dart';
import 'app_state_manager.dart';
import 'package:flutter/material.dart';
import 'app_link.dart';

class BookRouterDelegate extends RouterDelegate<Applink>
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
  Applink get currentConfiguration => getCurrentPath();

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
  Future<void> setNewRoutePath(Applink newlink) async {
    switch (newlink.location) {
      case Applink.splashPath:
        appStateManager.initislizeApp();
        break;
      case Applink.cartPath:
        appStateManager.onCartTapped(true);
        break;
      case Applink.settingsPath:
        appStateManager.onSettingTapped(true);
        break;
      case Applink.checkoutPath:
        appStateManager.onCheckoutTapped(true);
        break;
      case Applink.itemPath:
        final itemId = newlink.itemId;
        if (itemId != null) {
          bookManager.setSelectedBookItem(itemId);
        }
        break;
      case Applink.readBookPath:
        final itemid = newlink.itemId;
        if (itemid != null) {
          bookManager.setSelectedBookItem(itemid);
          appStateManager.onReadBookTapped(true);
        }
    }
  }

  Applink getCurrentPath() {
    // Sign Up Path
    if (appStateManager.isSignUp && !appStateManager.onSignUpComplete) {
      return Applink(location: Applink.signupPath);
    }

    // Login Path
    else if (!appStateManager.isLoggedIn &&
        appStateManager.isInitialized &&
        !appStateManager.onSignUpComplete) {
      return Applink(location: Applink.loginPath);
    }

    // Check Out Path
    else if (appStateManager.onCheckout) {
      return Applink(location: Applink.checkoutPath);
    }

    // Mybooks Path
    else if (appStateManager.onMyBooks) {
      return Applink(location: Applink.mybooksPath);
    }

    // Settings Path
    else if (appStateManager.onSettings && !appStateManager.onMyBooks) {
      return Applink(location: Applink.settingsPath);
    }

    // Cart Path
    else if (appStateManager.onCart) {
      return Applink(location: Applink.cartPath);
    }

    // Read Book Path
    else if (bookManager.selectedBookItem != null &&
        appStateManager.onReadBook) {
      final id = bookManager.selectedBookItem?.id;
      return Applink(location: Applink.readBookPath, itemId: id);
    }

    // Details book Path
    else if (bookManager.selectedBookItem != null) {
      final id = bookManager.selectedBookItem?.id;
      return Applink(location: Applink.itemPath, itemId: id);
    }

    // Home Path
    else if (appStateManager.onSignUpComplete && !appStateManager.isSignUp ||
        appStateManager.isLoggedIn) {
      return Applink(location: Applink.homePath);
    }
    // Default Path
    else {
      return Applink(location: Applink.splashPath);
    }
  }

  @override
  void dispose() {
    appStateManager.removeListener(notifyListeners);
    bookManager.removeListener(notifyListeners);
    super.dispose();
  }
}
