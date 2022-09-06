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

import 'package:books/helpers/book_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../helpers/constants.dart';
import '../helpers/helper_function.dart';
import '../router/app_state_manager.dart';
import '../router/book_pages.dart';
import 'read_book_screen.dart';
import '../widgets/primary_button.dart';
import '../widgets/subtitle_text_widget.dart';
import '../widgets/title_text_widget.dart';

import '../widgets/custom_app_bar.dart';

class DetailsScreen extends StatefulWidget {
  static MaterialPage page({Book? book, int index = -1}) {
    return MaterialPage<Page>(
        name: BookPages.detailsPath,
        key: ValueKey(BookPages.detailsPath),
        child: DetailsScreen(
          bookData: book!,
          index: index,
        ));
  }

  const DetailsScreen({Key? key, required this.bookData, this.index = -1})
      : super(key: key);

  final Book bookData;
  final int index;

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final HelperFunction _helperFunction = HelperFunction();

  @override
  Widget build(BuildContext context) {
    final width = _helperFunction.getWidth(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(
        title: 'Detail Screen',
        showIcon: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    widget.bookData.image.toString(),
                    width: 100,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: width - 140,
                      child: TitleTextWidget(
                        title: widget.bookData.name.toString(),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        width: width - 140,
                        child: SubTitleTextWidget(
                            title: widget.bookData.author.toString())),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        width: width - 140,
                        child: SubTitleTextWidget(
                            title: widget.bookData.description.toString())),
                    const SizedBox(
                      height: 10,
                    ),
                    SubTitleTextWidget(
                        title:
                            'Version: ' + widget.bookData.version.toString()),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                PrimaryButton(
                    width: width * 0.5,
                    title: 'Sample',
                    onPressed: () {
                      Provider.of<AppStateManager>(context, listen: false)
                          .onReadBookTapped(true);
                    }),
                PrimaryButton(
                    width: width * 0.5,
                    title: 'Buy Now',
                    onPressed: () {
                      cartItems.add(widget.bookData);
                      _helperFunction.showToast(
                          Colors.green, 'Book Added To Cart');
                      print('Added to cart $cartItems');
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
