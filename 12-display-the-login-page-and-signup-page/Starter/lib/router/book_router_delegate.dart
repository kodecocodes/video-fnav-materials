import '../helpers/book_data.dart';
import '../screens/login_screen.dart';
import '../screens/splash_screen.dart';
import 'app_state_manager.dart';
import 'package:flutter/material.dart';

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
      key: navigatorKey,
      pages: [
        if(!appStateManager.isInitialized)SplashScreen.page(),
        if(appStateManager.isInitialized)LoginScreen.page(),
      ],
    );
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
