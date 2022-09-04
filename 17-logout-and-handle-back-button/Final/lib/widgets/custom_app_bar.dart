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
import '../helpers/constants.dart';
import '../helpers/helper_function.dart';

import '../screens/cart_screen.dart';
import '../screens/settings_screen.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final bool showIcon;

  CustomAppBar({Key? key, required this.title, required this.showIcon}) 
  : super(key: key);

  final HelperFunction _helperFunction = HelperFunction();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      centerTitle: false,
      title: Text(
        title,
        style: kAppBarTextStyle,
      ),
      iconTheme: const IconThemeData(color: Colors.white70),
      actions:  [
        showIcon ? IconButton(
            onPressed: () =>
                Provider.of<AppStateManager>(context, listen: false)
                      .onCartTapped(true);
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.white70,
            )) : Container(),
        showIcon ? IconButton(
            onPressed: () =>
                 Provider.of<AppStateManager>(context, listen: false)
                      .onSettingTapped(true);
            icon: const Icon(
              Icons.settings,
              color: Colors.white70,
            )): Container()
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
