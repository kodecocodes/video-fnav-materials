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

import '../helpers/book_data.dart';
import 'package:flutter/material.dart';
import '../helpers/constants.dart';
import '../helpers/helper_function.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/primary_button.dart';
import '../widgets/subtitle_text_widget.dart';
import '../widgets/title_text_widget.dart';

class ReadBookScreen extends StatefulWidget {
  static MaterialPage page(Book? book) {
    return MaterialPage(
      name: BookPages.readBookPath,
      key: ValueKey(BookPages.readBookPath),
      child: ReadBookScreen(bookData: book!),
    );
  }

  const ReadBookScreen({Key? key, required this.bookData}) : super(key: key);

  final Book bookData;

  @override
  _ReadBookScreenState createState() => _ReadBookScreenState();
}

class _ReadBookScreenState extends State<ReadBookScreen> {
  final HelperFunction _helperFunction = HelperFunction();

  @override
  Widget build(BuildContext context) {
    final width = _helperFunction.getWidth(context);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(title: '', showIcon: true),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      widget.bookData.image,
                      height: MediaQuery.of(context).size.height * 0.3,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                      child: TitleTextWidget(
                          title: widget.bookData.name.toString())),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    width: width - 50,
                    child: SubTitleTextWidget(title: readBook),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  PrimaryButton(
                      width: width * 0.5,
                      title: 'Buy Now',
                      onPressed: () {
                        cartItems.add(widget.bookData);
                        _helperFunction.showToast(
                            Colors.green, 'Book Added To Cart');
                        print('Added to cart $cartItems');
                      }),
                ]),
          ),
        ),
      ),
    );
  }
}
