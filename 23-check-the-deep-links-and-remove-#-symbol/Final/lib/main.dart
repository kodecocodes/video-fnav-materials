// Copyright (c) 2022 Razeware LLC
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
// distribute, sublicense, create a derivative work, and/or sell copies of the
// Software in any work that is designed, intended or marketed for pedagogical
// or instructional purposes related to programming, coding, application
// development, or information technology.  Permission for such use, copying,
// modification, merger, publication, distribution, sublicensing, creation of
// derivative works or sale is expressly withheld.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';
import 'router/app_state_manager.dart';
import 'router/book_router_delegate.dart';
import 'helpers/book_data.dart';
import 'router/book_router_parser.dart';

void main() {
  setPathUrlStrategy();
  runApp(const Book());
}

class Book extends StatefulWidget {
  const Book({Key? key}) : super(key: key);

  @override
  State<Book> createState() => _BookState();
}

class _BookState extends State<Book> {
  final _bookManager = BookManager();
  final _appStateManager = AppStateManager();
  final bookRouteParser = BookRouterParser();
  late final BookRouterDelegate _bookRouterDelegate;

  @override
  void initState() {
    super.initState();
    _bookRouterDelegate = BookRouterDelegate(
        appStateManager: _appStateManager, bookManager: _bookManager);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => _appStateManager),
          ChangeNotifierProvider(create: (context) => _bookManager),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerDelegate: _bookRouterDelegate,
          backButtonDispatcher: RootBackButtonDispatcher(),
          routeInformationParser: bookRouteParser,
        ));
  }
}



// Android deep link

// ~/Library/Android/sdk/platform-tools/adb shell am start -a android.intent.action.VIEW \
//     -c android.intent.category.BROWSABLE \
//     -d 'rwbook://example.com/settings'

// iOS Deep Links
// xcrun simctl openurl booted 'rwbook://example.com/settings'