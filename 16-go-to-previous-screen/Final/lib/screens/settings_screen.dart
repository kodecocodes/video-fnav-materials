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
import '../helpers/helper_function.dart';
import 'my_books_screen.dart';
import '../widgets/custom_app_bar.dart';

import '../helpers/constants.dart';
import '../widgets/primary_button.dart';
import 'login_screen.dart';

class SettingsScreen extends StatelessWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: BookPages.settingsPath,
      key: ValueKey(BookPages.settingsPath),
      child: SettingsScreen(),
    );
  }

  SettingsScreen({Key? key}) : super(key: key);

  final HelperFunction _helperFunction = HelperFunction();

  @override
  Widget build(BuildContext context) {
    final width = _helperFunction.getWidth(context);
    return Scaffold(
      appBar: CustomAppBar(title: 'Settings', showIcon: false),
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 200,
          ),
          Center(
              child: PrimaryButton(
                  width: width,
                  title: 'My Books',
                  onPressed: () {
                    Provider.of<AppStateManager>(context, listen: false)
                        .onMyBookTapped(true);
                  })),
          const SizedBox(
            height: 50,
          ),
          Center(
            child: PrimaryButton(
                width: width,
                title: 'Logout',
                onPressed: () {
                  // TODO: Logout from the app and then use nav 2 to navigate
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute<MaterialPageRoute>(
                          builder: (_) => const LoginScreen()),
                      (route) => false);
                }),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 100, left: 20),
            child: Text(
              'Made with Love',
              style: kAppBarTextStyle.copyWith(
                  fontSize: 15, color: Colors.white70),
            ),
          )
        ],
      ),
    );
  }
}
