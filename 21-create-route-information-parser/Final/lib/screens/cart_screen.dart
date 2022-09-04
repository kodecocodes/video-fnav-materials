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
import 'checkout_screen.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/primary_button.dart';
import '../widgets/subtitle_text_widget.dart';
import '../widgets/title_text_widget.dart';

class CartScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: BookPages.cartPath,
      key: ValueKey(BookPages.cartPath),
      child: const CartScreen(),
    );
  }

  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final HelperFunction _helperFunction = HelperFunction();

  @override
  Widget build(BuildContext context) {
    final width = _helperFunction.getWidth(context);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(title: 'My Cart', showIcon: false),
      body: SafeArea(
        child: Stack(
          children: [
            cartItems.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      itemCount: cartItems.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            color: Colors.grey.shade800,
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          cartItems[index].image.toString(),
                                          width: 100,
                                          fit: BoxFit.fitWidth,
                                        )),
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 10.0),
                                        child: SizedBox(
                                            width: width - 170,
                                            child: TitleTextWidget(
                                                title: cartItems[index]
                                                    .name
                                                    .toString())),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 10.0),
                                        child: SizedBox(
                                            width: width - 170,
                                            child: SubTitleTextWidget(
                                                title: cartItems[index]
                                                    .author
                                                    .toString())),
                                      ),
                                      SizedBox(
                                        width: width - 150,
                                        child: Row(
                                          children: [
                                            const Spacer(),
                                            GestureDetector(
                                              child: Icon(
                                                Icons.delete,
                                                color:
                                                    Colors.red.withOpacity(0.8),
                                                size: 30,
                                              ),
                                              onTap: () {
                                                cartItems.removeAt(index);
                                                setState(() {});
                                              },
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ]),
                          ),
                        );
                      },
                    ),
                  )
                : const Center(
                    child: TitleTextWidget(
                    title: 'No Items In Cart',
                  )),
            cartItems.isNotEmpty
                ? Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 30.0),
                      child: PrimaryButton(
                        title: 'Checkout',
                        width: 300,
                        onPressed: () {
                          Provider.of<AppStateManager>(context, listen: false)
                              .onCheckoutTapped(true);
                        },
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
